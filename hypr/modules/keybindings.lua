---------------
---- INPUT ----
---------------

hl.config({
  input = {
    kb_layout  = "us",
    kb_variant =   "",
    kb_model   =   "",
    kb_options =   "",
    kb_rules   =   "",

    follow_mouse = 1,

    sensitivity = 0.5,

    touchpad = {
      natural_scroll = true,
    },
  },
})

hl.gesture({ fingers = 3, direction = "vertical", action = "workspace" })
hl.device({ name = "keyd-virtual-pointer", sensitivity = -0.5, })

---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER"

hl.bind("SUPER + CONTROL + ALT + SHIFT + SPACE", hl.dsp.exec_cmd(Terminal))

hl.bind(mainMod .. " + B",         hl.dsp.exec_cmd(Browser)                                 )
hl.bind(mainMod .. " + W",         hl.dsp.window.close()                                    )
hl.bind(mainMod .. " + M",         hl.dsp.exit()                                    )
hl.bind(mainMod .. " + E",         hl.dsp.exec_cmd(FileManager)                             )
hl.bind(mainMod .. " + V",         hl.dsp.window.float({ action = "toggle" })               )
hl.bind(mainMod .. " + D",         hl.dsp.exec_cmd("pkill " .. Menu .. " || " .. Launchmenu))
hl.bind(mainMod .. " + P",         hl.dsp.window.pseudo()                                   )
hl.bind(mainMod .. " + F",         hl.dsp.window.fullscreen()                               )
hl.bind(mainMod .. " + SHIFT + R", hl.dsp.layout("togglesplit")                             )

hl.bind(mainMod .. " + PRINT", hl.dsp.exec_cmd("pkill slurp || grim -c -g \"$(slurp)\" - | wl-copy"))
hl.bind("CONTROL + PRINT",     hl.dsp.exec_cmd("pkill slurp || grim -c -g \"$(slurp)\" - | swappy -f -"))
hl.bind("PRINT",               hl.dsp.exec_cmd("grim -c - | wl-copy"))

hl.bind(mainMod .. " + CONTROL + B", hl.dsp.exec_cmd("sh ~/.local/bin/birthday.sh"))

local directions = {
  { key = "H", direction = "left"  },
  { key = "L", direction = "right" },
  { key = "K", direction = "up"    },
  { key = "J", direction = "down"  },
}

for _, v in ipairs(directions) do
  hl.bind(mainMod .. " + " .. v.key,           hl.dsp.focus({ direction = v.direction })      )
  hl.bind(mainMod .. " + SHIFT + " .. v.key,   hl.dsp.window.move({ direction = v.direction }))
end

for i = 1, 10 do
  local key = i % 10
  hl.bind(mainMod .. " + " .. key,         hl.dsp.focus({ workspace = i})       )
  hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

hl.bind(mainMod .. " + S",          hl.dsp.workspace.toggle_special("magic")           )
hl.bind(mainMod .. " + SHIFT + S",  hl.dsp.window.move({ workspace = "special:magic" }))

hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

hl.bind(mainMod .. " + mouse:272",            hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273",            hl.dsp.window.resize(), { mouse = true })
hl.bind(mainMod .. " + CONTROL + mouse:272",  hl.dsp.window.resize(), { mouse = true })

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })

hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })

