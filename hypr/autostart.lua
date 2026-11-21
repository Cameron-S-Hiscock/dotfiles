-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

hl.on("hyprland.start", function () 
    hl.exec_cmd("waybar & hyprpaper")
    hl.exec_cmd("noise-alert")

    hl.exec_cmd(Apps.browser, { workspace = "2 silent" })
    hl.exec_cmd(Apps.steam, { workspace = "8 silent" })
    hl.exec_cmd(Apps.discord, { workspace = "special:magic silent" })
    hl.exec_cmd(Apps.access, { workspace = "1" })

    --hl.dispatch(hl.dspfocusworkspace(1))
    --hl.dispatch(hl.dsp.focusmonitor and hl.dsp.focusmonitor("HDMI-A-1") or nil)
    --hl.timer(function()
    --    hl.dispatch(hl.dsp.cursor.move({ x = 960, y = 540 }))
    --end, { timeout = 500, type = "oneshot" })
end)
