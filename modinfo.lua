name = "每日礼物"
description = "每天会发布一个礼物，礼物里有丰厚的奖励"
author = "凌"
version = "1.0.0"

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
    }
}
