local awful = require("awful")

client.connect_signal( "tag::switched", function(c)
  if #awful.screen.focused().clients > 0 then
    awful.screen.focused().clients[1]:emit_signal("request::activate", "mouse_enter", { raise = false })
  end
end)

client.connect_signal("mouse::enter", function(c)
    c:emit_signal("request::activate", "mouse_enter", { raise = false})
end)
