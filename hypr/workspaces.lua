-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
hl.monitor({
    output   = "HDMI-A-1",
    mode     = "1920x1080@60",
    position = "1920x0",
    scale    = 1,
})

hl.monitor({
    output   = "DP-2",
    mode     = "1920x1080@60",
    position = "0x0",
    scale    = 1,
})

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

local suppressMaximizeRule = hl.window_rule({
    -- Ignore maximize requests from all apps. You'll probably like this.
    name  = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})
-- suppressMaximizeRule:set_enabled(false)

hl.window_rule({
    -- Fix some dragging issues with XWayland
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})

-- Layer rules also return a handle.
-- local overlayLayerRule = hl.layer_rule({
--     name  = "no-anim-overlay",
--     match = { namespace = "^my-overlay$" },
--     no_anim = true,
-- })
-- overlayLayerRule:set_enabled(false)

-- Hyprland-run windowrule
hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },

    move  = "20 monitor_h-120",
    float = true,
})

hl.workspace_rule({
    workspace = "1",
    default_name = "MAIN",
    monitor = "HDMI-A-1",
})

hl.workspace_rule({
    workspace = "2",
    default_name = "WEB",
    monitor = "DP-2",
})
hl.window_rule({
    match = { class = string.format("^(%s)$", Apps.onion) },
    workspace = "2",
})

hl.workspace_rule({
    workspace = "3",
    default_name = "CODE",
    monitor = "HDMI-A-1",
})
hl.window_rule({
    match = { class = string.format("^(%s)$", Apps.code) },
    workspace = 3,
})

hl.workspace_rule({
    workspace = "4",
    default_name = "FILES",
    monitor = "DP-2",
})
hl.window_rule({
    match = { class = string.format("^(%s)$", Apps.fileManagerGUI) },
    workspace = "4",
})

hl.workspace_rule({
    workspace = "5",
    default_name = "DESIGN",
    monitor = "HDMI-A-1",
})

hl.workspace_rule({
    workspace = "6",
    monitor = "DP-2",
})

hl.workspace_rule({
    workspace = "7",
    default_name = "OFFICE",
    monitor = "HDMI-A-1",
})
hl.window_rule({
    match = { class = string.format("^(%s)$", Apps.office) },
    workspace = "7",
})

hl.workspace_rule({
    workspace = "8",
    default_name = "GAMES",
    monitor = "DP-2",
})
hl.window_rule({
    match = { class = string.format("^(%s)$", Apps.steam) },
    workspace = "8",
})

hl.workspace_rule({
    workspace = "9",
    monitor = "HDMI-A-1",
})

hl.workspace_rule({
    workspace = "10",
    default_name = "VM",
    monitor = "DP-2",
})
hl.window_rule({
    match = { class = string.format("^(%s)$", Apps.vm) },
    workspace = "10",
})

hl.window_rule({
    match = { class = string.format("^(%s)$", Apps.discord) },
    workspace = "special:magic",
})
hl.window_rule({
    match = { class = string.format("^(%s)$", Apps.music) },
    workspace = "special:magic",
})
hl.window_rule({
    match = { class = string.format("^(%s)$", Apps.zoom) },
    workspace = "special:magic",
})
