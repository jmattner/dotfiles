return {
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "rcarriga/nvim-dap-ui",
            "theHamsta/nvim-dap-virtual-text",
            "nvim-lua/plenary.nvim",
        },
        opts = function(_, opts)
            local dap = require("dap")

            if not dap.adapters["coreclr"] then
                local adapter = {
                    type = "executable",
                    command = vim.fn.exepath("netcoredbg"),
                    args = { "--interpreter=vscode" },
                    -- console = "internalConsole",
                }
                -- fix from here: https://github.com/jay-babu/mason-nvim-dap.nvim/issues/132
                if vim.fn.has("win32") == 1 then
                    adapter.options = {
                        detached = false
                    }
                end
                require("dap").adapters["coreclr"] = adapter
            end

            local dotnet = require("easy-dotnet")
            local debug_dll = nil
            local function ensure_dll()
                if debug_dll ~= nil then
                    return debug_dll
                end
                local dll = dotnet.get_debug_dll()
                debug_dll = dll
                return dll
            end

            for _, lang in ipairs({ "cs", "fsharp", "vb" }) do
                dap.configurations[lang] = {
                    {
                        log_level = "DEBUG",
                        type = "coreclr",
                        justMyCode = false,
                        stopAtEntry = false,
                        name = "Default",
                        request = "launch",
                        console = "integratedTerminal",
                        env = function()
                            local dll = ensure_dll()
                            local vars = dotnet.get_environment_variables(dll.project_name, dll.relative_project_path)
                            return vars or nil
                        end,
                        program = function()
                            require("overseer").enable_dap()
                            local dll = ensure_dll()
                            return dll.relative_dll_path
                        end,
                        cwd = function()
                            local dll = ensure_dll()
                            print("cwd: " .. dll.relative_project_path)
                            return dll.relative_project_path
                        end,
                        preLaunchTask = "Build .NET App With Spinner",
                    },
                }

                dap.listeners.before["event_terminated"]["easy-dotnet"] = function()
                    debug_dll = nil
                end
            end

            -- -- Standard GDScript adapter for non-C# projects
            -- dap.adapters.godot = {
            --     type = 'server',
            --     host = '127.0.0.1',
            --     port = 6006,
            -- }
            --
            -- dap.configurations.gdscript = {
            --     {
            --         type = 'godot',
            --         request = 'launch',
            --         name = 'Launch Scene',
            --         project = '${workspaceFolder}',
            --         launch_scene = true,
            --     },
            -- }

            -- TODO - automagically select a configuration based on presence of godot project file?
            table.insert(dap.configurations.cs, {
                name = 'Debug with Godot',
                type = 'coreclr',
                request = 'attach',
                processId = function()
                    return coroutine.create(function(dap_run_co)
                        local overseer = require("overseer")
                        local params = {
                            -- TODO from somewhere else
                            godot_path = "godot-mono",
                            godot_console_path = "godot-mono",
                            on_started = function(pid)
                                if pid == nil then
                                    coroutine.resume(dap_run_co, dap.ABORT)
                                end
                                coroutine.resume(dap_run_co, pid)
                            end
                        }
                        overseer.run_template({
                            name = "Launch Godot",
                            params = params,
                        })
                    end)
                end,
                -- TODO - find godot project files, picker if multiple found
                -- cwd = function()
                -- end,
            })

            return opts
        end,
        keys = {
            { "<leader>d", "", desc = "+debug", mode = { "n", "v" } },
            -- HYDRA MODE
            -- NOTE: the delay is set to prevent the which-key hints to appear
            {
                "<leader>d<space>",
                function()
                    require("which-key").show({ delay = 1000000000, keys = "<leader>d", loop = true })
                end,
                desc = "DAP Hydra Mode (which-key)",
            },
            {
                "<leader>dB",
                function()
                    require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
                end,
                desc = "Breakpoint Condition",
            },
            {
                "<leader>db",
                function() require("dap").toggle_breakpoint() end,
                desc = "Toggle Breakpoint",
            },
            {
                "<leader>dc",
                function() require("dap").continue() end,
                desc = "Continue",
            },
            {
                "<leader>dC",
                function() require("dap").run_to_cursor() end,
                desc = "Run to Cursor",
            },
            {
                "<leader>dj",
                function() require("dap").step_into() end,
                desc = "Step Into",
            },
            {
                "<leader>dk",
                function() require("dap").step_out() end,
                desc = "Step Out",
            },
            {
                "<leader>dl",
                function() require("dap").step_over() end,
                desc = "Step Over",
            },
            {
                "<leader>dp",
                function() require("dap").pause() end,
                desc = "Pause",
            },
            {
                "<leader>dr",
                function() require("dap").repl.toggle() end,
                desc = "Toggle REPL",
            },
            {
                "<leader>ds",
                function() require("dap").session() end,
                desc = "Session",
            },
            {
                "<leader>dt",
                function() require("dap").terminate() end,
                desc = "Terminate",
            },
            {
                "<leader>dw",
                function() require("dap.ui.widgets").hover() end,
                desc = "Widgets",
            },
            {
                "<leader>md",
                function() require("dapui").toggle() end,
                desc = "DapUI",
            },
        },
        -- lots taken from here https://godotforums.org/d/41943-how-can-i-use-netcoredbg-to-debug-c-on-godot/2
        config = function()
            local dap = require("dap")
            require("nvim-dap-virtual-text").setup({})
            vim.g.dap_virtual_text = true

            local dapui = require("dapui")
            dapui.setup()

            dap.listeners.before.attach.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.launch.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated.dapui_config = function()
                dapui.close()
            end
            dap.listeners.before.event_exited.dapui_config = function()
                dapui.close()
            end

            vim.fn.sign_define('DapBreakpoint', { text = '●', texthl = 'DapBreakpoint', linehl = '', numhl = '' })
            vim.fn.sign_define('DapBreakpointCondition',
                { text = '◆', texthl = 'DapBreakpointCondition', linehl = '', numhl = '' })
            vim.fn.sign_define('DapLogPoint', { text = '◆', texthl = 'DapLogPoint', linehl = '', numhl = '' })
            vim.fn.sign_define('DapStopped',
                { text = '→', texthl = 'DapStopped', linehl = 'DapStopped', numhl = 'DapStopped' })
            vim.fn.sign_define('DapBreakpointRejected',
                { text = '●', texthl = 'DapBreakpointRejected', linehl = '', numhl = '' })
            -- vim.fn.sign_define("DapBreakpoint", { text = "🔴", texthl = "", linehl = "", numhl = "" })
            -- vim.fn.sign_define("DapStopped", { text = "→", texthl = "", linehl = "", numhl = "" })

            -- hack to get debugger paths working
            -- from here: https://github.com/mfussenegger/nvim-dap/issues/1337
            -- vim.defer_fn(function()
            --     vim.opt.shellslash = false
            -- end, 5000)
        end
    },
}
