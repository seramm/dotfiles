local helpers = require("helpers")
local awful = require("awful")
local fylesystem = require("gears.filesystem")
local config_dir = fylesystem.get_configuration_dir()

local function autostart()


  helpers.run_once("picom --experimental-backends", function()
    awful.spawn("picom --experimental-backends --config ".. config_dir .. "configuration/picom.conf", false)
  end)

  helpers.run_once("nm-applet", function()
    awful.spawn("nm-applet", false)
  end)



end 

autostart()
