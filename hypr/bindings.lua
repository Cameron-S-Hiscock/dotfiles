-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more

-- V = Virtualization
-- C = Coding
-- G = Games
-- D = Design
-- O = Office
-- M = Communication
-- W = Web

hl.bind(Apps.mainMod .. " + Q", hl.dsp.exec_cmd(Apps.terminal))
hl.bind(Apps.mainMod .. " + Y", hl.dsp.exec_cmd("env NO_FASTFETCH=1 " .. Apps.terminal, {
    float = true,
    pin = true,
    size = {"(monitor_w/3)", "(monitor_h/3)"},
    move = {"(cursor_x)-(monitor_w/6)", "(cursor_y)-(monitor_h/6)"}
}))

hl.bind(Apps.mainMod .. " + R", hl.dsp.exec_cmd(Apps.menu))

hl.bind(Apps.mainMod .. " + E", hl.dsp.exec_cmd(Apps.terminal .. " " .. Apps.fileManager))
hl.bind(Apps.mainMod .. " + SHIFT + E", hl.dsp.exec_cmd(Apps.fileManagerGUI))

-- WEB
hl.bind(Apps.mainMod .. " + W + B", hl.dsp.exec_cmd(Apps.browser))
hl.bind(Apps.mainMod .. " + W + C", hl.dsp.exec_cmd(Apps.chromium))
hl.bind(Apps.mainMod .. " + W + T", hl.dsp.exec_cmd(Apps.onion))

-- GAMES
hl.bind(Apps.mainMod .. " + G + S", hl.dsp.exec_cmd(Apps.steam))
hl.bind(Apps.mainMod .. " + G + D", hl.dsp.exec_cmd(Apps.emulator))

-- VIRTUALIZATION
hl.bind(Apps.mainMod .. " + V + X", hl.dsp.exec_cmd(Apps.vbox))
hl.bind(Apps.mainMod .. " + V + W", hl.dsp.exec_cmd(Apps.vmware))

-- OFFICE
hl.bind(Apps.mainMod .. " + O", hl.dsp.exec_cmd(Apps.office))

-- CODING
hl.bind(Apps.mainMod .. " + C + V", hl.dsp.exec_cmd(Apps.code))
hl.bind(Apps.mainMod .. " + C + G", hl.dsp.exec_cmd(Apps.godot))
hl.bind(Apps.mainMod .. " + C + A", hl.dsp.exec_cmd(Apps.arduino))
hl.bind(Apps.mainMod .. " + A", hl.dsp.exec_cmd(Apps.access))

-- COMMUNICATION
hl.bind(Apps.mainMod .. " + M + D", hl.dsp.exec_cmd(Apps.discord))
hl.bind(Apps.mainMod .. " + M + Z", hl.dsp.exec_cmd(Apps.zoom))

-- DESIGN
hl.bind(Apps.mainMod .. " + D + F", hl.dsp.exec_cmd(Apps.freecad))
hl.bind(Apps.mainMod .. " + D + K", hl.dsp.exec_cmd(Apps.kicad))
hl.bind(Apps.mainMod .. " + D + W", hl.dsp.exec_cmd(Apps.drawing))
hl.bind(Apps.mainMod .. " + D + B", hl.dsp.exec_cmd(Apps.blender))
hl.bind(Apps.mainMod .. " + D + I", hl.dsp.exec_cmd(Apps.inkscape))

hl.bind("SUPER + SHIFT + F23", hl.dsp.exec_cmd(Apps.halo))

hl.bind(Apps.mainMod .. " + SHIFT + P", hl.dsp.exec_cmd("hyprshot -m region -o ~/Pictures/Screenshots/"))

hl.bind(Apps.mainMod .. " + F", hl.dsp.window.fullscreen({ mode = "maximized" }))
hl.bind(Apps.mainMod .. " + SHIFT + F", hl.dsp.window.fullscreen({ mode = 0 }))

local closeWindowBind = hl.bind("ALT + F4", hl.dsp.window.close())
-- closeWindowBind:set_enabled(false)

hl.bind(Apps.mainMod .. " + SHIFT + M", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))

hl.bind(Apps.mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(Apps.mainMod .. " + J", hl.dsp.layout("togglesplit"))    -- dwindle only

hl.bind(Apps.mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(Apps.mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(Apps.mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(Apps.mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

-- Switch workspaces with Apps.mainMod + [0-9]
-- Move active window to a workspace with Apps.mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(Apps.mainMod .. " + " .. key,             hl.dsp.focus({ workspace = i}))
    hl.bind(Apps.mainMod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
end

hl.bind(Apps.mainMod .. " + S",         hl.dsp.workspace.toggle_special("magic"))
hl.bind(Apps.mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

hl.bind(Apps.mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(Apps.mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with Apps.mainMod + LMB/RMB and dragging
hl.bind(Apps.mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(Apps.mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })
