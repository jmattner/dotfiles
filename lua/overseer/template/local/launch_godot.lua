local tmpl = {
    name = "Launch Godot",
    builder = function(params)
        local getGodotPid = function()
            local pattern = params.godot_path:gsub("([%(%)%.%%%+%-%*%?%[%^%$])", "%%%1")
            local processes = require("dap.utils").get_processes({ filter = pattern })
            if #processes == 1 then
                return processes[1].pid
            end
            return nil
        end

        local task_config = {
            -- TODO - check for nil in condition callback
            cmd = params.godot_console_path or "Godot_v4.3-stable_mono_win64_console.exe",
            args = {},
            name = "Launch Godot",
            components = {
                {
                    "local.run_on_godot_started",
                    on_started = function()
                        local pid = getGodotPid()
                        params.on_started(pid)
                    end
                },
                { "unique", replace = true, },
                "default",
            },
        }
        return task_config
    end,
    params = {
        godot_path = {
            type = "string",
            default = "",
            description = "Path to the godot executable",
        },
        godot_console_path = {
            type = "string",
            default = "",
            description = "Path to the godot console executable",
        },
        on_started = {
            type = "opaque",
            description = "to be run upon detection of Godot running",
        },
    },
}
return tmpl
