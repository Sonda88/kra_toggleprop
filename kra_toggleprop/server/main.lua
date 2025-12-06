local VorpCore = {}
TriggerEvent("getCore", function(core)
    VorpCore = core
end)

local VorpInv = exports.vorp_inventory:vorp_inventoryApi()

CreateThread(function()
    for maskKey, conf in pairs(Config.Masks) do
        if conf.itemName then
            VorpInv.RegisterUsableItem(conf.itemName, function(data)
                TriggerClientEvent("kra:toggleMask", data.source, maskKey)
                VorpInv.CloseInv(data.source)
            end)
        end
    end
end)
