pcall(require, "luarocks.loader")
local beautiful = require("beautiful")
local gears = require("gears")

beautiful.init(gears.filesystem.get_themes_dir() .. "default/theme.lua")

require("configuration")
require("interface")

local function autostart()
  local helpers = require("helpers")
  local awful = require("awful")
  local fylesystem = require("gears.filesystem")
  local config_dir = fylesystem.get_configuration_dir()
  helpers.run_once("picom --experimental-backends", function()
    awful.spawn("picom --experimental-backends --config ".. config_dir .. "configuration/picom.conf", false)
  end)

end 

autostart()
