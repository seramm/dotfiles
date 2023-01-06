local awful = require("awful")
local dpi = require("beautiful").xresources.apply_dpi
local gears = require("gears")
local watch = awful.widget.watch
local wibox = require("wibox")

local configdir = gears.filesystem.get_configuration_dir()
local icondir = configdir .. "interface/theme/icons/"

return function()
  local hdd_widget = wibox.widget {
    {
      {
        {
          {
            {
              id = "icon",
              image = icondir .. "memory.png",
              resize = true,
              forced_height = dpi(30),
              forced_width = dpi(30),
              widget = wibox.widget.imagebox,
            },
            id = "icon_layout",
            widget = wibox.container.place
          },
          top = dpi(2),
          widget = wibox.container.margin,
          id = "icon_margin"
        },
        spacing = dpi(7),
        {
          id = "label",
          align = "center",
          valign = "center",
          font = "Iosevka Nerd Font Mono Bold 10",
          widget = wibox.widget.textbox
        },
        id = "hdd_layout",
        layout = wibox.layout.fixed.horizontal
      },
      id = "container",
      left = dpi(8),
      right = dpi(8),
      widget = wibox.container.margin
    },
    bg = "#3A475C",
    fg = "#ffffff",
    shape = function(cr, width, height)
      gears.shape.rounded_rect(cr, width, height, 5)
    end,
    widget = wibox.container.background
  }

  watch(configdir .. "helpers/hdd.sh",
    3,
    function(_, stdout)
      if stdout ~= nil then
        hdd_widget.container.hdd_layout.label.text = "No ED"
      else
        hdd_widget.container.hdd_layout.label.text = stdout
      end
      print(hdd_widget.container.hdd_layout.label.text)
    end
  )
  return hdd_widget
end
