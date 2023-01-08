local awful = require("awful")
local dpi = require("beautiful").xresources.apply_dpi
local gears = require("gears")
local watch = awful.widget.watch
local wibox = require("wibox")

local icondir = gears.filesystem.get_configuration_dir() .. "interface/theme/icons/"

return function()
  local ram_widget = wibox.widget {
    {
      {
        {
          {
            id = "bar",
            max_value = 1,
            color = "#00ff83",
            background_color = "#282c34",
            forced_height = dpi(5),
            shape = gears.shape.rounded_bar,
            widget = wibox.widget.progressbar
          },
          id = "place",
          valign = "top",
          forced_height = dpi(5),
          forced_width = dpi(10),
          widget = wibox.container.place
        },
        id = "margin",
        top = dpi(2),
        left = dpi(8),
        right = dpi(8),
        widget = wibox.container.margin
      },
      {
        {
          {
            {
              {
                id = "icon",
                image = icondir .. "memory.png",
                resize = true,
                forced_height = dpi(28),
                forced_width = dpi(28),
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
          id = "ram_layout",
          layout = wibox.layout.fixed.horizontal
        },
        id = "container",
        left = dpi(8),
        right = dpi(8),
        widget = wibox.container.margin
      },
      id = "stack",
      widget = wibox.layout.stack
    },
    bg = "#b967ff",
    fg = "#ffffff",
    shape = function(cr, width, height)
      gears.shape.rounded_rect(cr, width, height, 5)
    end,
    widget = wibox.container.background
  }

  --Hover_signal(ram_widget, color["Red200"], color["Grey900"])

  watch(
    [[ bash -c "cat /proc/meminfo| grep Mem | awk '{print $2}'" ]],
    3,
    function(_, stdout)

      local MemTotal, MemFree, MemAvailable = stdout:match("(%d+)\n(%d+)\n(%d+)\n")
      --ram_widget.stack.container.ram_layout.label.text = tostring(string.format("%.1f", ((MemTotal - MemAvailable) / 1024 / 1024)) .. " GB"):gsub(",", ".")

      local MemInUse = MemTotal - MemAvailable
      ram_widget.stack.container.ram_layout.label.text = tostring(string.format("%.1f", MemInUse / 1024^2) .. " GB"):gsub(",", ".")
      ram_widget.stack.margin.place.bar:set_value(MemInUse / MemTotal)
    end
  )

  return ram_widget
end
