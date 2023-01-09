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
        {
          {
            {
              id = "bar",
              --color = "#00ff83",
              color = {
                type = "linear",
                from = { 0, 0},
                to = { 30, 0},
                stops = {
                  { 0, "#00ff83"},
                  { 0.45, "#00ff83"},
                  { 0.45, "#ffbf00"},
                  { 0.6, "#ffbf00"},
                  { 0.6, "#ff0000"},
                  { 1, "#ff0000"}
                }
              },
              max_value = 1,
              background_color = "#282c34",
              forced_width = dpi(5),
              shape = gears.shape.rounded_bar,
              widget = wibox.widget.progressbar,
            },
            id = "rotate",
            forced_width = dpi(5),
            direction = "east",
            layout = wibox.container.rotate,
          },
        id = "margin",
        top = dpi(2),
        bottom = dpi(2),
        widget = wibox.container.margin
        },
        id = "cputemp_layout",
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
    [[ bash -c "sensors | grep Core | awk '{print $3}'" ]],
    3,
    function(_, stdout)
      local cores = {}
      local avg = 0
      for line in stdout:gmatch("[^\n]+") do
        line = line:gsub("+", "")
        line = string.sub(line, 1, -3)
        table.insert(cores, tonumber(string.match(line, "%d-%.%d+")))
      end
      for i, core in ipairs(cores) do
        avg = avg + core
      end
      local average = avg / 4

      cputemp_widget.container.cputemp_layout.label.text = tostring(string.format("%.1f", average) .. "ºC"):gsub(",", ".")
      cputemp_widget.container.cputemp_layout.margin.rotate.bar:set_value(average / 100)
      --[[if average < 45 then
        cputemp_widget.container.cputemp_layout.margin.rotate.bar.color = "#00ff83"
      elseif average >= 45 and average < 50  then
        cputemp_widget.container.cputemp_layout.margin.rotate.bar.color = "#ffbf00"
      elseif average >= 50 then
        cputemp_widget.container.cputemp_layout.margin.rotate.bar.color = "#cc3300"
      end
      ]]
    end
  )

  return cputemp_widget
end
