
require("awful.autofocus")
require("awful.remote")

do -- Handle runtime errors after startup
    local in_error = false
    awesome.connect_signal("debug::error", function (err)
        -- Make sure we don't go into an endless error loop
        if in_error then return end
        in_error = true

        naughty.notify({
            preset = naughty.config.presets.critical,
            title = "Oops, an error happened after startup!",
            text = tostring(err)
        })

        in_error = false
    end)
end

-- default settings
require('wm.defaults')

-- Keymaps
require('wm.keymaps')

-- Battery notification
require('wm.battery')

-- Signals
require('wm.signals')

-- Autostarting applications
require('wm.autostart')

