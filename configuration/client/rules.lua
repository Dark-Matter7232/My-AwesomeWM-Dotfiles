local awful = require("awful")
local gears = require("gears")
local client_keys = require("configuration.client.keys")
local client_buttons = require("configuration.client.buttons")

-- Rules
awful.rules.rules = {
    -- All clients will match this rule.
    {
        rule = {},
        properties = {
            focus = awful.client.focus.filter,
            raise = true,
            keys = client_keys,
            buttons = client_buttons,
            screen = awful.screen.preferred,
            placement = awful.placement.no_offscreen,
            floating = false,
            maximized = false,
            above = false,
            below = false,
            ontop = false,
            sticky = false,
            maximized_horizontal = false,
            maximized_vertical = false
        }
    },
    -- Titlebars
    {
        rule_any = {
            type = {"dialog"},
            class = {"Wicd-client.py", "calendar.google.com"}
        },
        properties = {
            placement = awful.placement.centered,
            ontop = true,
            floating = true,
            drawBackdrop = true,
            shape = function()
                return function(cr, w, h)
                    gears.shape.rounded_rect(cr, w, h, 8)
                end
            end,
            skip_decoration = true
        }
    },
  {
    -- For those programs that don't play nice in tiled mode
    rule_any = {class = {'Android Studio', 'android-studio', 'android studio', 'android-dev', 'Android-Emulator', 'Emulator'}},
    properties = {
        size_hints_honor = false,
        floating = true,
    },
  },
    -- Titlebars
  {
    rule_any = {
      type = {'dialog'},
      instance = {'file_progress'}, -- For nemo
      class = {'Nm-connection-editor', 'Ibus-setup', 'Pavucontrol'}
    },
    properties = {
      placement = awful.placement.centered,
      ontop = true,
      floating = true,
      drawBackdrop = true,
      shape = function()
        return function(cr, w, h)
          gears.shape.rounded_rect(cr, w, h, 8)
        end
      end,
      skip_decoration = true
    }
  },
    -- Browser
    {
        rule_any = {
            class = {"brave", "Brave"}
        },
        properties = {
            tag = "1"
        }
    },
    -- Code
    {
        rule_any = {
            class = {"code-oss", "subl", "Sublime Text", "Sublime-Text", "Sublime", "Sublime text", "Sublime-text", "Meld", "PyCharm Community Edition", "Arduino IDE", "Arduino IDE(Arduino IDE)", "Arduino IDE (Arduino IDE)", "PyCharm", "Ghex", 'Android Studio'}
        },
        properties = {
            tag = "2"
        }
    },
    -- Social
    {
        rule_any = {
            class = {"Caprine", "Telegram", "YouTube Music"}
        },
        properties = {
            tag = "3"
        }
    },
    -- Games
    {
        rule_any = {
            class = {"Lutris"},
            name = {"Lutris"}
        },
        properties = {
            tag = "4"
        }
    },
    -- Media
    {
        rule_any = {
            class = {"spotify", "Spotify", "Spotify Free", "VLC Media Player", "VLC media player", "Spotify(adblock)", "VLC", "Vlc"}
        },
        properties = {
            tag = "6"
        }
    }
}
