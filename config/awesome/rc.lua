pcall(require, "luarocks.loader")
local beautiful = require("beautiful")
local gears = require("gears")

beautiful.init(gears.filesystem.get_themes_dir() .. "default/theme.lua")

require("configuration")
require("interface")


