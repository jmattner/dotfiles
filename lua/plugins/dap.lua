return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "theHamsta/nvim-dap-virtual-text",
        "nvim-lua/plenary.nvim",
    },
    config = function()
        local dap = require("dap")
        local pickers = require "telescope.pickers"
        local finders = require "telescope.finders"
        local conf = require("telescope.config").values

        local colors = function(opts)
              opts = opts or {}
              pickers.new(opts, {
            prompt_title = "colors",
            finder = finders.new_table {
              results = { "red", "green", "blue" }
            },
            sorter = conf.generic_sorter(opts),
          }):find()
        end

        dap.adapters.coreclr = {
            type = "executable",
            command = vim.fn.stdpath("data") .. "\\mason\\packages\\netcoredbg\\netcoredbg\\netcoredbg.exe",
            args = { "--interpreter=vscode" },
        }

        dap.configurations.cs = {
            {
                type = "coreclr",
                name = "launch - netcoredbg",
                request = "launch",
                console = "integratedTerminal",
                program = function()
                    vim.print('test')

                    return vim.fn.input('Path to dll: ', vim.fn.getcwd() .. '\\bin\\Debug\\net9.0\\DebugTest.dll', 'file')
                end,
            }
        }

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

        vim.fn.sign_define("DapBreakpoint", { text = "🔴", texthl = "", linehl = "", numhl = "" })
        vim.fn.sign_define("DapStopped", { text = "→", texthl = "", linehl = "", numhl = "" })

        vim.keymap.set('n', '<leader>dh', require('dap').continue, { desc = "continue" })
        vim.keymap.set('n', '<leader>dl', require('dap').step_over, { desc = "step over" })
        vim.keymap.set('n', '<leader>dj', require('dap').step_into, { desc = "step into" })
        vim.keymap.set('n', '<leader>dk', require('dap').step_out, { desc = "step out" })
        vim.keymap.set("n", "<leader>db", require("dap").toggle_breakpoint, { desc = "toggle breakpoint" })
        vim.keymap.set("n", "<leader>dx", require("dap").terminate, { desc = "terminate" })
        vim.keymap.set("n", "<leader>dz", require("dap").disconnect, { desc = "disconnect" })
        vim.keymap.set("n", "<leader>dd", function()
            colors()
        end, { desc = "foo" })

        -- vim.keymap.set("n", "<leader>dr", ":lua require'dap'.repl.open()<CR>")
        -- vim.keymap.set("n", "<leader>dR", ":lua require'dap'.run_last()<CR>")

        -- hack to get debugger paths working
        -- from here: https://github.com/mfussenegger/nvim-dap/issues/1337
        vim.defer_fn(function()
            vim.opt.shellslash = false
        end, 5000)
    end,
}
