Config = {}

--[[

    This is a free VORP-compatible resource that allows you to attach any 3D prop
    to the character’s head (or any other configurable bone).

    The system uses a toggle method: simply use the item in your inventory
    to equip or unequip the prop automatically.
    You can use it for masks, helmets, accessories,
    or any other custom 3D prop you want to attach to the player.

    HOW TO GET THE CORRECT POSITION (offset & rotation):
    ----------------------------------------------------
    Use:
    • Spooner or any other tool you prefer

    Recommended steps:
    1) Start with offset {0.0, 0.0, 0.0}
    2) Adjust x, y, z until the prop is positioned correctly
    3) Adjust rotation.x, rotation.y, rotation.z until it aligns perfectly

    You can add an unlimited number of custom props by editing the configuration below.

]]

Config.Masks = {
    -- BASIC EXAMPLE (you can copy and modify it):
    ["Gold"] = {
        itemName = "muerte_gold",
        model    = "masc_esp_sdli_gold",
        boneName = "skel_head",
        offset   = { x = 0.05, y = 0.08, z = 0.0 },
        rotation = { x = -89.0, y = -91.0, z = 0.0 },
    }
}

--[[ 
    EXAMPLES OF YOUR MASKS (COMMENTED)
    ----------------------------------

    IMPORTANT:
    The actual prop models for these masks are available in my shop.
    The examples below are for demonstration purposes only.

    -- Mask Santa Muerte Argento
    Config.Masks["muerte_silver"] = {
        itemName = "muerte_silver",
        model    = "masc_esp_sdli",
        boneName = "skel_head",
        offset   = { x = 0.05, y = 0.08, z = 0.0 },
        rotation = { x = -89.0, y = -91.0, z = 0.0 },
    }

    -- Mask Santa Muerte Oro
    Config.Masks["muerte_gold"] = {
        itemName = "muerte_gold",
        model    = "masc_esp_sdli_gold",
        boneName = "skel_head",
        offset   = { x = 0.05, y = 0.08, z = 0.0 },
        rotation = { x = -89.0, y = -91.0, z = 0.0 },
    }

    -- Mask Santa Muerte Rossa
    Config.Masks["muerte_red"] = {
        itemName = "muerte_red",
        model    = "masc_esp_sdli_rosso",
        boneName = "skel_head",
        offset   = { x = 0.05, y = 0.08, z = 0.0 },
        rotation = { x = -89.0, y = -91.0, z = 0.0 },
    }

]]
