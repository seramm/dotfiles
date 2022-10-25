local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local dpi = require("beautiful").xresources.apply_dpi

return function()
  local layout = wibox.widget {
    {
      {
        awful.widget.layoutbox(),
        id = "icon_layout",
        widget = wibox.container.place
      },
      id = "icon_margin",
      left = dpi(5),
      right = dpi(5),
      forced_width = dpi(40),
      widget = wibox.container.margin
    },
    bg = "#282c34",
    shape = function(cr, width, height)
      gears.shape.rounded_rect(cr, width, height, 5)
    end,
    widget = wibox.container.background
  }

  return layout
end

