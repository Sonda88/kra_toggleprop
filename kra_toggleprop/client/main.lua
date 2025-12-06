
local ActiveMasks = {}
local MaskEntities = {}

local function attachMask(maskKey)
    local conf = Config.Masks[maskKey]
    if not conf then return end

    local ped = PlayerPedId()
    local modelHash = GetHashKey(conf.model)

    RequestModel(modelHash)
    local timeout = GetGameTimer() + 5000
    while not HasModelLoaded(modelHash) do
        Wait(10)
        if GetGameTimer() > timeout then
            return
        end
    end

    local x, y, z = table.unpack(GetEntityCoords(ped))
    local obj = CreateObject(modelHash, x, y, z + 0.2, true, true, true)

    local bone = conf.boneName or "skel_head"
    local boneIndex = GetEntityBoneIndexByName(ped, bone)
    if boneIndex == -1 then
        boneIndex = 21030
    end

    local off = conf.offset
    local rot = conf.rotation

    AttachEntityToEntity(
        obj, ped, boneIndex,
        off.x, off.y, off.z,
        rot.x, rot.y, rot.z,
        true, true, false, true, 1, true
    )

    MaskEntities[maskKey] = obj
    ActiveMasks[maskKey] = true
end

local function detachMask(maskKey)
    local obj = MaskEntities[maskKey]
    if obj and DoesEntityExist(obj) then
        DetachEntity(obj, false, true)
        DeleteObject(obj)
    end
    MaskEntities[maskKey] = nil
    ActiveMasks[maskKey] = false
end

local function clearAllMasksExcept(keep)
    for mask, _ in pairs(ActiveMasks) do
        if mask ~= keep then
            detachMask(mask)
        end
    end
end

RegisterNetEvent("kra:toggleMask", function(maskKey)
    if ActiveMasks[maskKey] then
        detachMask(maskKey)
    else
        clearAllMasksExcept(maskKey)
        attachMask(maskKey)
    end
end)
