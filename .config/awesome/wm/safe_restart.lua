
local awful = require("awful")

local function safe_restart ()
    awful.spawn.easy_async("awesome -k", function (_, _, _, exit_code)
        if exit_code == 0 then
            awesome.restart()
        else
            naughty.notify({
                preset = naughty.config.presets.critical,
                title = "BROKEN CONFIG",
                text = "awesome not restarted"
            })
        end
    end)
end

return safe_restart
