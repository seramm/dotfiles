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
        id = "ram_layout",
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

  --Hover_signal(ram_widget, color["Red200"], color["Grey900"])

  watch(
    [[ bash -c "cat /proc/meminfo| grep Mem | awk '{print $2}'" ]],
    3,
    function(_, stdout)

      local MemTotal, MemFree, MemAvailable = stdout:match("(%d+)\n(%d+)\n(%d+)\n")

      ram_widget.container.ram_layout.label.text = tostring(string.format("%.1f", ((MemTotal - MemAvailable) / 1024 / 1024)) .. " GB"):gsub(",", ".")
    end
  )

  return ram_widget
end
