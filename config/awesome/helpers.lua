local awful = require ("awful")
local string = string

local helpers = {}

function helpers.run_once(command, action)
  awful.spawn.easy_async_with_shell(string.format("ps aux | grep '%s' | grep -v 'grep'", command), function(stdout)
    if stdout == "" or stdout == nil then
      action()
    end
  end)
end

return helpers
