local awful = require("awful")
local dpi = require("beautiful").xresources.apply_dpi
local gears = require("gears")
local watch = awful.widget.watch
local wibox = require("wibox")

local configdir = gears.filesystem.get_configuration_dir()
local icondir = configdir .. "interface/theme/icons/"
local scriptdir = configdir .. "helpers/hdd.sh"

local colors = {
  nodisk = "#e86e56",
  default = "#00ff83",
}

return function()
  local hdd_widget = wibox.widget {
    {
      {
        {
          {
            {
              id = "icon",
              image = icondir .. "hdd.png",
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
        id = "hdd_layout",
        layout = wibox.layout.fixed.horizontal
      },
      id = "container",
      left = dpi(8),
      right = dpi(8),
      widget = wibox.container.margin
    },
    fg = "#282c34",
    shape = function(cr, width, height)
      gears.shape.rounded_rect(cr, width, height, 5)
    end,
    widget = wibox.container.background
  }

  watch(scriptdir,
    3,
    function(_, stdout)
      stdout = string.gsub(stdout, "\n", "")
      if stdout:match("nodisk") then
        hdd_widget.container.hdd_layout.label.text = "No disk"
      else
        hdd_widget.container.hdd_layout.label.text = stdout
      end
      hdd_widget.bg = colors[stdout] or colors.default
    end
  )
  return hdd_widget
end
