local awful = require("awful")
local dpi = require("beautiful").xresources.apply_dpi
local gears = require("gears")
local watch = awful.widget.watch
local wibox = require("wibox")

local icondir = gears.filesystem.get_configuration_dir() .. "interface/theme/icons/"

return function()
  local cpu_widget = wibox.widget {
    {
      {
        {
          {
            {
              id = "icon",
              image = icondir .. "cpu.png",
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
        id = "cpu_layout",
        layout = wibox.layout.fixed.horizontal
      },
      id = "container",
      left = dpi(8),
      right = dpi(8),
      widget = wibox.container.margin
    },
    --bg = "#189ad3",
    bg = "#7992d0",
    fg = "#ffffff",
    shape = function(cr, width, height)
      gears.shape.rounded_rect(cr, width, height, 5)
    end,
    widget = wibox.container.background
  }

  watch(
    [[ bash -c "cat /proc/cpuinfo | grep MHz | awk '{print $4}'" ]],
    3,
    function(_, stdout)
      local freq = {}
      local avg = 0
      for line in stdout:gmatch("[^\n]+") do
        table.insert(freq, tonumber(string.match(line, "%d+")))
      end

      for i, core in ipairs(freq) do
        avg = avg + core
      end

      local average = avg / 8

      cpu_widget.container.cpu_layout.label.text = tostring(string.format("%.1f", average / 1000) .. " GHz"):gsub(",", ".")
    end
  )

  return cpu_widget
end
