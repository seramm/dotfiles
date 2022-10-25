local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local dpi = require("beautiful").xresources.apply_dpi

return function(s, widgets)


  local leftbar = awful.popup {
    screen = s,
    widget = wibox.container.background,
    ontop = false,
    bg = "#282c34",
    visible = true,
    maximum_width = dpi(650),
    placement = function(c) awful.placement.top_left(c, { margins = dpi(10) }) end,
    shape = function(cr, width, height)
      gears.shape.rounded_rect(cr, width, height, 10)
    end,
  }

  leftbar:struts {
    top = 55
  }

local function prepare_widgets(widgets)
    local layout = {
      forced_height = 45,
      layout = wibox.layout.fixed.horizontal
    }
    for i, widget in pairs(widgets) do
      if i == 1 then
        table.insert(layout,
          {
          widget,
          left = dpi(6),
          right = dpi(3),
          top = dpi(6),
          bottom = dpi(6),
          widget = wibox.container.margin
        })
      elseif i == #widgets then
        table.insert(layout,
          {
          widget,
          left = dpi(3),
          right = dpi(6),
          top = dpi(6),
          bottom = dpi(6),
          widget = wibox.container.margin
        })
      else
        table.insert(layout,
          {
          widget,
          left = dpi(3),
          right = dpi(3),
          top = dpi(6),
          bottom = dpi(6),
          widget = wibox.container.margin
        })
      end
    end
    return layout
  end

  leftbar:setup {
    prepare_widgets(widgets),
    nil,
    nil,
    layout = wibox.layout.fixed.horizontal,
  }

  end
