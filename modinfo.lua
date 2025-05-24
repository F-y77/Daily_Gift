name = "每日礼物"
description = "每天会发布一个礼物，礼物里有丰厚的奖励"
author = "凌"
version = "1.2.0"

forumthread = ""

api_version = 10

dont_starve_compatible = false
reign_of_giants_compatible = false
dst_compatible = true

all_clients_require_mod = true
client_only_mod = false

icon_atlas = "modicon.xml"
icon = "modicon.tex" 

server_filter_tags = {
    "每日礼物",
    "凌",
}

configuration_options = {
    {
        name = "GIFT_TIME",
        label = "礼物发放时间",
        options = {
            {description = "黎明", data = "dawn"},
            {description = "白天", data = "day"},
            {description = "黄昏", data = "dusk"},
        },
        default = "day",
    },
    {
        name = "GIFT_ANNOUNCEMENT",
        label = "礼物公告",
        options = {
            {description = "开启", data = true},
            {description = "关闭", data = false},
        },
        default = true,
    },
    {
        name = "GIFT_MIN_COUNT",
        label = "每日礼物最少物品数",
        options = {
            {description = "1", data = 1},
            {description = "2", data = 2},
            {description = "3", data = 3},
            {description = "4", data = 4},
            {description = "5", data = 5},
        },
        default = 2,
    },
    {
        name = "GIFT_MAX_COUNT",
        label = "每日礼物最多物品数",
        options = {
            {description = "2", data = 2},
            {description = "3", data = 3},
            {description = "4", data = 4},
            {description = "5", data = 5},
            {description = "6", data = 6},
        },
        default = 4,
    },
}
