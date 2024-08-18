
local awful = require("awful")
local gears = require("gears")

local vim_to_awe = {
    h = 'left',
    j = 'down',
    k = 'up',
    l = 'right',
}

local cfg_path = gears.filesystem.get_configuration_dir()
local nvim_move = cfg_path .. 'move.py'

return function(key)
    awful.spawn.easy_async_with_shell(nvim_move .. ' ' .. key,
        function (_, _, _, exit_code)
            if exit_code == 1 then
                awful.client.focus.global_bydirection(vim_to_awe[key])
            end
        end
    )
end
