local awful = require("awful")
local dpi = require("beautiful").xresources.apply_dpi
local gears = require("gears")
local wibox = require("wibox")

local icondir = gears.filesystem.get_configuration_dir() .. "interface/theme/icons/"

return function()

  local clock_widget = wibox.widget {
    {
      {
        {
          {
            {
              id = "icon",
              image = icondir .. "clock.png",
              resize = true,
              forced_height = dpi(20),
              forced_width = dpi(20),
              widget = wibox.widget.imagebox
            },
            id = "icon_layout",
            widget = wibox.container.place
          },
          id = "icon_margin",
          top = dpi(2),
          widget = wibox.container.margin
        },
        spacing = dpi(7),
        {
          id = "label",
          align = "center",
          valign = "center",
          format = "%H:%M",
          font = "Iosevka Nerd Font Mono Bold 11",
          widget = wibox.widget.textclock
        },
        id = "clock_layout",
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

  return clock_widget
end
