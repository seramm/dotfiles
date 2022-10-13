local awful = require("awful")
local ruled = require("ruled")


-- Rules to apply to new clients.
ruled.client.connect_signal("request::rules", function()
    -- All clients will match this rule.
    ruled.client.append_rule {
        id         = "global",
        rule       = { },
        properties = {
            focus     = awful.client.focus.filter,
            raise     = true,
            screen    = awful.screen.preferred,
            placement = awful.placement.no_overlap+awful.placement.no_offscreen
        }
    }

    -- Floating clients.
    ruled.client.append_rule {
        id       = "floating",
        rule_any = {
            instance = { "copyq", "pinentry" },
            name    = {
                "Event Tester",  -- xev.
            },
            role    = {
                "AlarmWindow",    -- Thunderbird's calendar.
                "ConfigManager",  -- Thunderbird's about:config.
                "pop-up",         -- e.g. Google Chrome's (detached) Developer Tools.
            }
        },
        properties = { floating = true }
    }

    -- Add titlebars to normal clients and dialogs
    ruled.client.append_rule {
        id         = "titlebars",
        rule_any   = { type = { "normal", "dialog" } },
        properties = { titlebars_enabled = true      }
    }

-- Other rules

    ruled.client.append_rule {
      rule       = { class = "KeePassXC" },
      properties = { tag = screen[1].tags[7] },
    }
    ruled.client.append_rule {
      rule       = { class = "thunderbird" },
      properties = { tag = screen[1].tags[5] },
    }
    ruled.client.append_rule {
      rule       = { class = "discord" },
      properties = { tag = screen[1].tags[4] },
    }

    ruled.client.append_rule {
      rule       = { class = "Yubico Authenticator" },
      properties = {
        floating  = true,
        ontop     = true,
        placement = awful.placement.centered,
        width     = 350,
        height    = 600,
        },
    }
    ruled.client.append_rule {
      rule       = { class = "Qalculate-gtk" },
      properties = {
        floating  = true,
        ontop     = true,
        placement = awful.placement.centered,
        width     = 550,
        height    = 600,
        },
    }
end)
