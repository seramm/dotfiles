local awful = require("awful")
local dpi = require("beautiful").xresources.apply_dpi
local gears = require("gears")
local watch = awful.widget.watch
local wibox = require("wibox")

local icondir = gears.filesystem.get_configuration_dir() .. "interface/theme/icons/"

return function()
  local cputemp_widget = wibox.widget {
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
        id = "cputemp_layout",
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
    [[ bash -c "sensors | grep Core | awk '{print $3}'" ]],
    3,
    function(_, stdout)
      local cores = {core0 = 0, core1 = 0, core2 = 0, core3 = 0}
      local avg = 0
      for i, line in stdout:gmatch("[^\n]+") do
        cores[i] = line
      end
      for i, core in ipairs(cores) do
        print(cores[i])
        core = core:gsub("+", "")
        core = core:gsub("ºC", "")
        cores[i] = core
      end
      for i, core in ipairs(cores) do
        avg = avg + core
      end

      cputemp_widget.container.cputemp_layout.label.text = tostring(string.format("%.1f", avg / 4) .. " ºC"):gsub(",", ".")
    end
  )

  return cputemp_widget
end
