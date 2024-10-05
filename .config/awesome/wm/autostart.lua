local awful = require("awful")

-- Autostarting applications
awful.spawn.with_shell("picom --no-fading-openclose --fade-in-step=1 --fade-out-step=1")
awful.spawn.with_shell("feh --bg-fill ~/.bg/frank.jpg") -- Hacky TODO Fix
awful.spawn.with_shell("setxkbmap -option caps:escape")
awful.spawn.with_shell("st -e nvim --listen /tmp/nvim.pipe +term")
