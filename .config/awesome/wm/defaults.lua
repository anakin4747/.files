local awful = require("awful")
local naughty = require("naughty")

local clientkeys = require("wm.keymaps")

-- default settings
awful.layout.layouts = { awful.layout.suit.fair, }
naughty.config.defaults.ontop = true
awful.rules.rules = {
    { -- All clients will match this rule.
        rule = { },
        properties = {
            border_width = 0,
            size_hints_honor = false,
            focus = awful.client.focus.filter,
            raise = true,
            keys = clientkeys,
            screen = awful.screen.preferred,
            placement = awful.placement.no_overlap + awful.placement.no_offscreen
        }
    },
    {
        rule = { class = "Tor Browser" },
        properties = { floating = true }
    },
}

-- Init tags
awful.screen.connect_for_each_screen(function(s)
    -- Each screen has its own tag table.
    awful.tag(
        { "1", "2", "3", "4", "5", "6", "7", "8", "9" },
        s, awful.layout.layouts[1]
    )
end)
