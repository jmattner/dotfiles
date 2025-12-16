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
                        detached = false,
                    }
                end
                dap.adapters["coreclr"] = adapter
            end

            dap.adapters["netcoredbg"] = dap.adapters["coreclr"]

            -- local dotnet = require("easy-dotnet")
            -- local debug_dll = nil
            -- local function ensure_dll()
            --     if debug_dll ~= nil then
            --         return debug_dll
            --     end
            --     local dll = dotnet.get_debug_dll()
            --     debug_dll = dll
            --     return dll
            -- end

            return opts
        end,
        keys = {
            { "<leader>d", "", desc = "+debug", mode = { "n", "v" } },
            {
                "<leader>dB",
                function()
                    require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
                end,
                desc = "Breakpoint Condition",
            },
            {
                "<leader>db",
                function()
                    require("dap").toggle_breakpoint()
                end,
                desc = "Toggle Breakpoint",
            },
            {
                "<leader>dc",
                function()
                    require("dap").continue()
                end,
                desc = "Continue",
            },
            {
                "<leader>dC",
                function()
                    require("dap").run_to_cursor()
                end,
                desc = "Run to Cursor",
            },
            {
                "<leader>dj",
                function()
                    require("dap").step_into()
                end,
                desc = "Step Into",
            },
            {
                "<leader>dk",
                function()
                    require("dap").step_out()
                end,
                desc = "Step Out",
            },
            {
                "<leader>dl",
                function()
                    require("dap").step_over()
                end,
                desc = "Step Over",
            },
            {
                "<leader>dp",
                function()
                    require("dap").pause()
                end,
                desc = "Pause",
            },
            {
                "<leader>dr",
                function()
                    require("dap").repl.toggle()
                end,
                desc = "Toggle REPL",
            },
            {
                "<leader>ds",
                function()
                    require("dap").session()
                end,
                desc = "Session",
            },
            {
                "<leader>dt",
                function()
                    require("dap").terminate()
                end,
                desc = "Terminate",
            },
            {
                "<leader>dw",
                function()
                    require("dap.ui.widgets").hover()
                end,
                desc = "Widgets",
            },
            {
                "<leader>md",
                function()
                    require("dapui").toggle()
                end,
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

            vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = "" })
            vim.fn.sign_define(
                "DapBreakpointCondition",
                { text = "◆", texthl = "DapBreakpointCondition", linehl = "", numhl = "" }
            )
            vim.fn.sign_define("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = "" })
            vim.fn.sign_define(
                "DapStopped",
                { text = "→", texthl = "DapStopped", linehl = "DapStopped", numhl = "DapStopped" }
            )
            vim.fn.sign_define(
                "DapBreakpointRejected",
                { text = "●", texthl = "DapBreakpointRejected", linehl = "", numhl = "" }
            )
            -- vim.fn.sign_define("DapBreakpoint", { text = "🔴", texthl = "", linehl = "", numhl = "" })
            -- vim.fn.sign_define("DapStopped", { text = "→", texthl = "", linehl = "", numhl = "" })

            -- hack to get debugger paths working
            -- from here: https://github.com/mfussenegger/nvim-dap/issues/1337
            -- vim.defer_fn(function()
            --     vim.opt.shellslash = false
            -- end, 5000)

            require("easy-dotnet.netcoredbg").register_dap_variables_viewer()
        end,
    },
}
