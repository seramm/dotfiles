pcall(require, "luarocks.loader")
local beautiful = require("beautiful")
local gears = require("gears")

beautiful.init(gears.filesystem.get_configuration_dir() .. "interface/theme/theme.lua")

require("configuration")
require("interface")
require("autostart")

