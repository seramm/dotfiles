--require("interface.bar.wibar")


local awful = require("awful")


awful.screen.connect_for_each_screen(function(s)
  local names = { "1", "2", "3", "4", "5", "6", "7", "8", "9" }
  local l = awful.layout.suit
  local layouts = l.tile
  awful.tag(names, s, layouts)

  s.clock = require("widgets.clock")()
  s.layoutbox = require("widgets.layoutbox")()
  s.taglist = require("widgets.taglist")(s)
  s.systray = require("widgets.systemtray")(s)

  require("interface.bar.leftbar")(s, {s.layoutbox, s.taglist})
  require("interface.bar.rightbar")(s, {s.systray, s.clock})
end)

