--[[

The main ones are Alt-[1-9],

Alt+esc for cycling within clients within tags
Alt+tab for cycling tags normally

--]]

local awful = require("awful")
local gears = require("gears")
local movement = require('wm.move')
local safe_restart = require('wm.safe_restart')

local terminal = "st -e nvim +term"
local modkey = "Mod1"
local winkey = "Mod4"

local globalkeys = gears.table.join(

    awful.key(
        { modkey }, "Tab", awful.tag.history.previous,
        { description = "go back", group = "tag" }
    ),

    awful.key(
        { modkey, "Shift" }, "Tab", awful.tag.history.next,
        { description = "go back", group = "tag" }
    ),

    awful.key(
        { modkey }, "Return", function () awful.spawn(terminal) end,
        { description = "open a terminal", group = "launcher" }
    ),

    awful.key(
        { modkey }, "r", safe_restart,
        { description = "reload awesome", group = "awesome" }
    ),

    awful.key(
        { modkey, "Shift" }, "q", awesome.quit,
        { description = "quit awesome", group = "awesome" }
    ),

    awful.key(
        { modkey, "Shift" }, "b", function () awful.spawn("brave") end,
        { description = "launch brave", group = "launcher" }
    ),

    awful.key(
        { modkey }, "b", function () awful.spawn("vieb") end,
        { description = "launch vieb", group = "launcher" }
    ),

    awful.key(
    -- TODO: Add notifications
        { modkey }, "s",
        function ()
            awful.util.spawn(
                "scrot -e 'mv $f ~/.screenshots/ 2> /dev/null'",
                false
            )
        end,
        { description = "screenshot", group = "launcher" }
    ),

    awful.key(
        { modkey }, "h", function () movement("h") end,
        { description = "move client focus left", group = "client" }
    ),
    awful.key(
        { modkey }, "j", function () movement("j") end,
        { description = "move client focus down", group = "client" }
    ),
    awful.key(
        { modkey }, "k", function () movement("k") end,
        { description = "move client focus up", group = "client" }
    ),
    awful.key(
        { modkey }, "l", function () movement("l") end,
        { description = "move client focus right", group = "client" }
    ),

    awful.key(
        { modkey, "Shift" }, "h",
        function () awful.client.swap.global_bydirection("left") end,
        { description = "swap client with left", group = "client" }
    ),
    awful.key(
        { modkey, "Shift" }, "j",
        function () awful.client.swap.global_bydirection("down") end,
        { description = "swap client with down", group = "client" }
    ),
    awful.key(
        { modkey, "Shift" }, "k",
        function () awful.client.swap.global_bydirection("up") end,
        { description = "swap client with up", group = "client" }
    ),
    awful.key(
        { modkey, "Shift" }, "l",
        function () awful.client.swap.global_bydirection("right") end,
        { description = "swap client with right", group = "client" }
    )
)

local clientkeys = {
    -- Alt q to quit
    awful.key(
        { modkey }, "q",
        function (c) c:kill() end,
        { description = "close", group = "client" }
    )
}

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
    globalkeys = gears.table.join(

        globalkeys,

        -- View tag only.
        awful.key(
            { winkey }, "#" .. i + 9,
            function ()
                local screen = awful.screen.focused()
                local tag = screen.tags[i]
                if tag then
                    tag:view_only()
                end
            end,
            { description = "view tag #" .. i, group = "tag" }
        ),
        -- Move client to tag.
        awful.key(
            { winkey, "Shift" }, "#" .. i + 9,
            function ()
                if client.focus then
                    local tag = client.focus.screen.tags[i]
                    if tag then
                        client.focus:move_to_tag(tag)
                    end
                end
            end,
            { description = "move focused client to tag #" .. i, group = "tag" }
        )
    )
end

-- Set keys
root.keys(globalkeys)

return clientkeys

