pcall(require, "luarocks.loader")
local beautiful = require("beautiful")
local gears = require("gears")

beautiful.init(gears.filesystem.get_themes_dir() .. "default/theme.lua")

require("configuration")
require("interface")

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
    c:activate { context = "mouse_enter", raise = false }
end)
