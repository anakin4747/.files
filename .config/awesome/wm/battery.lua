local awful = require("awful")
local naughty = require("naughty")

-- Battery notification
local function low_battery ()

    -- Exits with 0 if < 10% and discharging
    local awk_script = [[
        acpi | awk '{
            gsub("%,", "", $4); print $4;
            exit ! ($4+0 <= 10 && $3 ~ /Discharging/)
        }'
    ]]

    awful.spawn.easy_async_with_shell(awk_script,
        function (stdout, _, _, exit_code)
            if exit_code ~= 0 then return end
            naughty.notify({
                preset = naughty.config.presets.critical,
                title = "LOW BATTERY " .. stdout,
                timeout = 15,
            })
        end
    )
end

local bat_timer = timer({ timeout = 60 * 5 })
bat_timer:connect_signal("timeout", low_battery)
bat_timer:start()
