local right_monitor = "desc:GIGA-BYTE TECHNOLOGY CO. LTD. G27QC 0x000008D9"
local left_monitor = "desc:GIGA-BYTE TECHNOLOGY CO. LTD. G27QC A 0x0000043F"

hl.monitor({
    -- description = "right",
    output = right_monitor,
    mode = "2560x1440@164.80",
    position = "0x0",
    scale = "auto",
})

hl.monitor({
    -- description = "left",
    output = left_monitor,
    mode = "2560x1440@164.80",
    position = "-2560x0",
    scale = "auto",
})

hl.workspace_rule({ workspace = "1", monitor = left_monitor, default = false })
hl.workspace_rule({ workspace = "2", monitor = left_monitor, default = false })
hl.workspace_rule({ workspace = "3", monitor = left_monitor, default = false })
hl.workspace_rule({ workspace = "4", monitor = left_monitor, default = false })
hl.workspace_rule({ workspace = "5", monitor = left_monitor, default = true })
hl.workspace_rule({ workspace = "6", monitor = right_monitor, default = true })
hl.workspace_rule({ workspace = "7", monitor = right_monitor, default = false })
hl.workspace_rule({ workspace = "8", monitor = right_monitor, default = false })
hl.workspace_rule({ workspace = "9", monitor = right_monitor, default = false })
hl.workspace_rule({ workspace = "10", monitor = right_monitor, default = false })

hl.window_rule({
    name = "suppress-maximize",
    match = {
        { class = ".*" }
    },
    suppress_event = "maximize"
})

hl.window_rule({
    name = "no-focus-untitled",
    match = {
        {
            class = "^$",
            title = "^$",
            xwayland = 1,
            float = 1,
            fullscreen = 0,
            pin = 0
        }
    },
    no_focus = true
})
