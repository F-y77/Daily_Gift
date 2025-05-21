-- 全局变量
local _G = GLOBAL
local TUNING = _G.TUNING
local TheNet = _G.TheNet
local AllPlayers = _G.AllPlayers
local SpawnPrefab = _G.SpawnPrefab
local TheWorld = _G.TheWorld

-- 礼物配置
local GIFT_ITEMS = {
    -- 基础资源
    {prefab = "goldnugget", count = {min = 5, max = 10}, weight = 10},
    {prefab = "flint", count = {min = 10, max = 20}, weight = 10},
    {prefab = "rocks", count = {min = 10, max = 20}, weight = 10},
    {prefab = "log", count = {min = 10, max = 20}, weight = 10},
    {prefab = "twigs", count = {min = 10, max = 20}, weight = 10},
    {prefab = "cutgrass", count = {min = 10, max = 20}, weight = 10},
    
    -- 食物
    {prefab = "honey", count = {min = 5, max = 10}, weight = 8},
    {prefab = "berries", count = {min = 10, max = 20}, weight = 8},
    {prefab = "carrot", count = {min = 10, max = 20}, weight = 8},
    {prefab = "seeds", count = {min = 10, max = 20}, weight = 8},
    {prefab = "meat", count = {min = 5, max = 10}, weight = 8},
    {prefab = "fish", count = {min = 5, max = 10}, weight = 8},
    
    -- 工具
    {prefab = "axe", count = {min = 1, max = 1}, weight = 5},
    {prefab = "pickaxe", count = {min = 1, max = 1}, weight = 5},
    {prefab = "shovel", count = {min = 1, max = 1}, weight = 5},
    {prefab = "hammer", count = {min = 1, max = 1}, weight = 5},
    {prefab = "razor", count = {min = 1, max = 1}, weight = 5},
    
    -- 装备
    {prefab = "armorwood", count = {min = 1, max = 1}, weight = 3},
    {prefab = "spear", count = {min = 1, max = 1}, weight = 3},
    {prefab = "backpack", count = {min = 1, max = 1}, weight = 3},
    {prefab = "umbrella", count = {min = 1, max = 1}, weight = 3},
    {prefab = "torch", count = {min = 1, max = 1}, weight = 3},
    
    -- 稀有物品
    {prefab = "purplegem", count = {min = 1, max = 2}, weight = 1},
    {prefab = "redgem", count = {min = 1, max = 2}, weight = 1},
    {prefab = "bluegem", count = {min = 1, max = 2}, weight = 1},
    {prefab = "orangegem", count = {min = 1, max = 2}, weight = 1},
    {prefab = "yellowgem", count = {min = 1, max = 2}, weight = 1},
    {prefab = "greengem", count = {min = 1, max = 2}, weight = 1},
}

-- 礼物发放函数
local function GiveGiftItems(player)
    if not player or not player:IsValid() then return end
    
    -- 随机选择2-4种物品
    local gift_count = math.random(2, 4)
    local given_items = {}
    
    for i = 1, gift_count do
        -- 根据权重随机选择物品
        local total_weight = 0
        for _, item in ipairs(GIFT_ITEMS) do
            total_weight = total_weight + item.weight
        end
        
        local random_weight = math.random() * total_weight
        local current_weight = 0
        local selected_item = nil
        
        for _, item in ipairs(GIFT_ITEMS) do
            current_weight = current_weight + item.weight
            if random_weight <= current_weight then
                selected_item = item
                break
            end
        end
        
        if selected_item then
            -- 生成物品
            local count = math.random(selected_item.count.min, selected_item.count.max)
            local item = SpawnPrefab(selected_item.prefab)
            
            if item then
                -- 如果是可堆叠物品，设置数量
                if item.components.stackable then
                    item.components.stackable:SetStackSize(count)
                end
                
                -- 尝试放入玩家背包
                if player.components.inventory then
                    if player.components.inventory:GiveItem(item) then
                        table.insert(given_items, {
                            name = item.prefab,
                            count = count
                        })
                    else
                        -- 如果背包满了，放在玩家脚下
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
    
    -- 通知玩家获得的物品
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

-- 初始化模组
AddPrefabPostInit("world", function(inst)
    if not _G.TheWorld.ismastersim then return end
    
    -- 记录上次发放礼物的天数
    local last_gift_day = 0
    
    -- 监听世界状态变化
    inst:WatchWorldState("phase", function()
        local current_phase = _G.TheWorld.state.phase
        local current_day = _G.TheWorld.state.cycles
        
        -- 检查是否到达指定时间且是新的一天
        if current_phase == GetModConfigData("GIFT_TIME") and current_day > last_gift_day then
            -- 获取所有在线玩家
            local players = {}
            for _, v in ipairs(AllPlayers) do
                if v:IsValid() then
                    table.insert(players, v)
                end
            end
            
            -- 给所有在线玩家发放礼物
            for _, player in ipairs(players) do
                GiveGiftItems(player)
            end
            
            -- 更新上次发放礼物的天数
            last_gift_day = current_day
        end
    end)
end)

-- 模组加载完成提示
print("[每日礼物] 模组加载完成")