vim.g.dotnet_build_project = function()
    local default_path = vim.fn.getcwd() .. '/'
    if vim.g['dotnet_last_proj_path'] ~= nil then
        default_path = vim.g['dotnet_last_proj_path']
    end
    local path = vim.fn.input({ prompt = 'Path to your *proj file: ', default = default_path, completion = 'file' })
    vim.g['dotnet_last_proj_path'] = path
    -- local cmd = 'dotnet build -c Debug "' .. path .. '" 2> /tmp/dap-debug-nvim-dotnet.log'
    local cmd = 'dotnet build -c Debug "' .. path .. '"'
    print('\n')
    print('Cmd to execute: ' .. cmd)
    local f = os.execute(cmd)
    if f == 0 then
        print('\nBuild: ' .. vim.g.gsign('✔️ ', 'OK'))
    else
        print('\nBuild: ' .. vim.g.gsign('❌', 'ERR') .. '(code: ' .. f .. ')')
    end
end

vim.g.dotnet_get_dll_path = function()
    local request = function()
        return vim.fn.input({ prompt = 'Path to dll: ', default = vim.fn.getcwd() .. '/bin/Debug/', completion = 'file' })
    end

    if vim.g['dotnet_last_dll_path'] == nil then
        vim.g['dotnet_last_dll_path'] = request()
    else
        if vim.fn.confirm('Do you want to change the path to dll?\n' .. vim.g['dotnet_last_dll_path'], '&yes\n&no', 2) == 1 then
            vim.g['dotnet_last_dll_path'] = request()
        end
    end
    return vim.g['dotnet_last_dll_path']
end

return {
    {
        "mfussenegger/nvim-dap",
        opts = {},
        config = function()
            local dap = require('dap')

            dap.adapters.coreclr = {
                type = 'executable',
                command = 'netcoredbg',
                args = { '--interpreter=vscode' }
            }

            local config = {
                {
                    type = "coreclr",
                    name = "launch - netcoredbg",
                    request = "launch",
                    console = "integratedTerminal",
                    program = function()
                        if vim.fn.confirm('Should I recompile first?', '&yes\n&no', 2) == 1 then
                            vim.g.dotnet_build_project()
                        end
                        return vim.g.dotnet_get_dll_path()
                    end,
                },
            }

            dap.configurations.cs = config
            dap.configurations.fsharp = config

            require("mason-nvim-dap").setup()
        end,
    },
    {
        "jay-babu/mason-nvim-dap.nvim",
        dependencies = {
            "mfussenegger/nvim-dap",
            "williamboman/mason.nvim",
        },
        cmd = { "DapInstall", "DapUninstall" },
        opts = {
            automatic_installation = true,

            -- You can provide additional configuration to the handlers,
            -- see mason-nvim-dap README for more information
            handlers = {},

            -- You'll need to check that you have the required things installed
            -- online, please don't ask me how to install them :)
            ensure_installed = {
                "netcoredbg",
            },
        },
        -- mason-nvim-dap is loaded when nvim-dap loads
        config = function() end,
    },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = { "nvim-neotest/nvim-nio" },
        -- stylua: ignore
        keys = {
            { "<leader>du", function() require("dapui").toggle({}) end,  desc = "Dap UI" },
            { "<leader>de", function() require("dapui").eval() end,      desc = "Eval",  mode = { "n", "v" } },
        },
        opts = {},
        config = function(_, opts)
            local dap = require("dap")
            local dapui = require("dapui")
            dapui.setup(opts)
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open({})
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close({})
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close({})
            end
        end,
    },
}
