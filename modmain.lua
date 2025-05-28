GLOBAL.setmetatable(env, {__index = function(t, k) return GLOBAL.rawget(GLOBAL, k) end})

local BASIC_ITEMS = {
    {prefab = "goldnugget", count = {min = 5, max = 15}, weight = 10},
    {prefab = "flint", count = {min = 10, max = 25}, weight = 10},
    {prefab = "rocks", count = {min = 10, max = 25}, weight = 10},
    {prefab = "log", count = {min = 10, max = 25}, weight = 10},
    {prefab = "twigs", count = {min = 10, max = 25}, weight = 10},
    {prefab = "cutgrass", count = {min = 10, max = 25}, weight = 10},
    {prefab = "charcoal", count = {min = 10, max = 20}, weight = 8},
    {prefab = "ash", count = {min = 10, max = 20}, weight = 8},
    {prefab = "nitre", count = {min = 5, max = 10}, weight = 8},
    {prefab = "saltrock", count = {min = 5, max = 10}, weight = 8},
    {prefab = "moonrocknugget", count = {min = 3, max = 8}, weight = 7},
    {prefab = "moonrock", count = {min = 2, max = 5}, weight = 7},
    {prefab = "moonrockcrater", count = {min = 2, max = 5}, weight = 7},

    {prefab = "honey", count = {min = 5, max = 15}, weight = 8},
    {prefab = "berries", count = {min = 10, max = 25}, weight = 8},
    {prefab = "carrot", count = {min = 10, max = 25}, weight = 8},
    {prefab = "seeds", count = {min = 10, max = 25}, weight = 8},
    {prefab = "meat", count = {min = 5, max = 15}, weight = 8},
    {prefab = "fish", count = {min = 5, max = 15}, weight = 8},
    {prefab = "drumstick", count = {min = 5, max = 10}, weight = 8},
    {prefab = "froglegs", count = {min = 5, max = 10}, weight = 8},
    {prefab = "monstermeat", count = {min = 3, max = 8}, weight = 6},
    {prefab = "cookedmonstermeat", count = {min = 3, max = 8}, weight = 6},
    {prefab = "butterflymuffin", count = {min = 1, max = 3}, weight = 7},
    {prefab = "frogglebunwich", count = {min = 1, max = 3}, weight = 7},
    {prefab = "taffy", count = {min = 1, max = 3}, weight = 7},
    {prefab = "pumpkincookie", count = {min = 1, max = 3}, weight = 7},
    {prefab = "mandrakesoup", count = {min = 1, max = 2}, weight = 6},
}

local GIFT_ITEMS = {
    --not sure useful exactily.
    {prefab = "axe", count = {min = 1, max = 1}, weight = 5},
    {prefab = "pickaxe", count = {min = 1, max = 1}, weight = 5},
    {prefab = "shovel", count = {min = 1, max = 1}, weight = 5},
    {prefab = "hammer", count = {min = 1, max = 1}, weight = 5},
    {prefab = "razor", count = {min = 1, max = 1}, weight = 5},
    {prefab = "bugnet", count = {min = 1, max = 1}, weight = 4},
    {prefab = "fishingrod", count = {min = 1, max = 1}, weight = 4},
    {prefab = "goldenaxe", count = {min = 1, max = 1}, weight = 3},
    {prefab = "goldenpickaxe", count = {min = 1, max = 1}, weight = 3},
    {prefab = "goldenshovel", count = {min = 1, max = 1}, weight = 3},
    {prefab = "golden_farm_hoe", count = {min = 1, max = 1}, weight = 3},
    {prefab = "golden_farm_hoe_placer", count = {min = 1, max = 1}, weight = 3},
    {prefab = "golden_farm_hoe_placer_placer", count = {min = 1, max = 1}, weight = 3},
    {prefab = "armorwood", count = {min = 1, max = 1}, weight = 3},
    {prefab = "spear", count = {min = 1, max = 1}, weight = 3},
    {prefab = "backpack", count = {min = 1, max = 1}, weight = 3},
    {prefab = "umbrella", count = {min = 1, max = 1}, weight = 3},
    {prefab = "torch", count = {min = 1, max = 1}, weight = 3},
    {prefab = "armorgrass", count = {min = 1, max = 1}, weight = 3},
    {prefab = "armormarble", count = {min = 1, max = 1}, weight = 2},
    {prefab = "armorsnurtleshell", count = {min = 1, max = 1}, weight = 2},
    {prefab = "footballhat", count = {min = 1, max = 1}, weight = 2},
    {prefab = "beefalohat", count = {min = 1, max = 1}, weight = 2},
    {prefab = "sweatervest", count = {min = 1, max = 1}, weight = 2},
    {prefab = "trunkvest_summer", count = {min = 1, max = 1}, weight = 2},
    {prefab = "trunkvest_winter", count = {min = 1, max = 1}, weight = 2},
    {prefab = "reflectivevest", count = {min = 1, max = 1}, weight = 2},
    {prefab = "hawaiianshirt", count = {min = 1, max = 1}, weight = 2},
    {prefab = "purplegem", count = {min = 1, max = 3}, weight = 1},
    {prefab = "redgem", count = {min = 1, max = 3}, weight = 1},
    {prefab = "bluegem", count = {min = 1, max = 3}, weight = 1},
    {prefab = "orangegem", count = {min = 1, max = 3}, weight = 1},
    {prefab = "yellowgem", count = {min = 1, max = 3}, weight = 1},
    {prefab = "greengem", count = {min = 1, max = 3}, weight = 1},
    {prefab = "thulecite", count = {min = 1, max = 2}, weight = 1},
    {prefab = "thulecite_pieces", count = {min = 2, max = 4}, weight = 1},
    {prefab = "nightmarefuel", count = {min = 2, max = 5}, weight = 1},
    {prefab = "livinglog", count = {min = 1, max = 3}, weight = 1},
    {prefab = "dragon_scales", count = {min = 1, max = 2}, weight = 1},
    {prefab = "deerclops_eyeball", count = {min = 1, max = 1}, weight = 1},
    {prefab = "bearger_fur", count = {min = 1, max = 1}, weight = 1},
    {prefab = "glommerfuel", count = {min = 1, max = 2}, weight = 1},
    {prefab = "spidergland", count = {min = 3, max = 6}, weight = 2},
    {prefab = "spidereggsack", count = {min = 1, max = 1}, weight = 1},
    {prefab = "beardhair", count = {min = 3, max = 6}, weight = 2},
    {prefab = "beefalowool", count = {min = 3, max = 6}, weight = 2},
    {prefab = "honeycomb", count = {min = 1, max = 2}, weight = 1},
    {prefab = "firestaff", count = {min = 1, max = 1}, weight = 2},
    {prefab = "icestaff", count = {min = 1, max = 1}, weight = 2},
    {prefab = "telestaff", count = {min = 1, max = 1}, weight = 2},
    {prefab = "orangestaff", count = {min = 1, max = 1}, weight = 2},
    {prefab = "greenstaff", count = {min = 1, max = 1}, weight = 2},
    {prefab = "yellowstaff", count = {min = 1, max = 1}, weight = 2},
    {prefab = "opalstaff", count = {min = 1, max = 1}, weight = 2},
    {prefab = "diviningrod", count = {min = 1, max = 1}, weight = 2},
    {prefab = "panflute", count = {min = 1, max = 1}, weight = 2},
    {prefab = "onemanband", count = {min = 1, max = 1}, weight = 2},
    {prefab = "flowerhat", count = {min = 1, max = 1}, weight = 2},
    {prefab = "strawhat", count = {min = 1, max = 1}, weight = 2},
    {prefab = "tophat", count = {min = 1, max = 1}, weight = 2},
    {prefab = "earmuffshat", count = {min = 1, max = 1}, weight = 2},
    {prefab = "winterhat", count = {min = 1, max = 1}, weight = 2},
    {prefab = "catcoonhat", count = {min = 1, max = 1}, weight = 2},
    {prefab = "walrushat", count = {min = 1, max = 1}, weight = 2},
    {prefab = "molehat", count = {min = 1, max = 1}, weight = 2},
    {prefab = "bushhat", count = {min = 1, max = 1}, weight = 2},
    {prefab = "rainhat", count = {min = 1, max = 1}, weight = 2},
}
local function GiveGiftItems(player)
    if not player or not player:IsValid() then return end
    
    -- number is radommmmmmm
    local min_count = GetModConfigData("GIFT_MIN_COUNT") or 2
    local max_count = GetModConfigData("GIFT_MAX_COUNT") or 4
    if min_count > max_count then min_count, max_count = max_count, min_count end
    local gift_count = math.random(min_count, max_count)
    
    local given_items = {}

    local item_list = GetModConfigData("BASIC_ITEMS_ONLY") and BASIC_ITEMS or GIFT_ITEMS
    
    for i = 1, gift_count do
        -- choice what?
        local total_weight = 0
        for _, item in ipairs(item_list) do
            total_weight = total_weight + item.weight
        end
        
        local random_weight = math.random() * total_weight
        local current_weight = 0
        local selected_item = nil
        
        for _, item in ipairs(item_list) do
            current_weight = current_weight + item.weight
            if random_weight <= current_weight then
                selected_item = item
                break
            end
        end
        
        if selected_item then
            -- god to create 
            local count = math.random(selected_item.count.min, selected_item.count.max)
            local item = SpawnPrefab(selected_item.prefab)
            
            if item then
                -- set stack
                if item.components.stackable then
                    item.components.stackable:SetStackSize(count)
                end
                
                -- put bag
                if player.components.inventory then
                    if player.components.inventory:GiveItem(item) then
                        table.insert(given_items, {
                            name = item.prefab,
                            count = count
                        })
                    else
                        -- put down
                        local x, y, z = player.Transform:GetWorldPosition()
                        item.Transform:SetPosition(x, y, z)
                        table.insert(given_items, {
                            name = item.prefab,
                            count = count
                        })
                    end
                end
            end
        end
    end
    
    -- notice
    if #given_items > 0 then
        local message = "你获得了以下礼物："
        for _, item in ipairs(given_items) do
            message = message .. "\n" .. item.name .. " x" .. item.count
        end
        
        if player.components.talker then
            player.components.talker:Say(message)
        end
        
        if TheNet:GetIsServer() and GetModConfigData("GIFT_ANNOUNCEMENT") then
            TheNet:SystemMessage(string.format("玩家 %s 获得了每日礼物！", player.name or "未知"))
        end
    end
end

--fuck cave listening
AddPrefabPostInit("world", function(inst)
    if not TheWorld.ismastersim then return end
    

    local last_gift_day = 0
    

    inst:WatchWorldState("phase", function()
        local current_phase = TheWorld.state.phase
        local current_day = TheWorld.state.cycles
        

        if current_phase == GetModConfigData("GIFT_TIME") and current_day > last_gift_day then

            local players = {}
            for _, v in ipairs(AllPlayers) do
                if v:IsValid() then
                    table.insert(players, v)
                end
            end
            

            for _, player in ipairs(players) do
                GiveGiftItems(player)
            end
            

            last_gift_day = current_day
        end
    end)
end)

