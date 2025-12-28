return {
    {
        "GustavEikaas/easy-dotnet.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "folke/snacks.nvim",
        },
        opts = {
            get_sdk_path = function()
                return "/usr/share/dotnet"
            end,
            picker = "snacks",
            auto_bootstrap_namespace = {
                type = "file_scoped",
                enabled = true,
                use_clipboard_json = {
                    behavior = "never",
                    register = "0",
                },
            },
            debugger = {
                bin_path = "netcoredbg",
            },
            ---@type TestRunnerOptions
            test_runner = {
                ---@type "split" | "vsplit" | "float" | "buf"
                viewmode = "float",
                ---@type number|nil
                vsplit_width = nil,
                ---@type string|nil "topleft" | "topright"
                vsplit_pos = nil,
                enable_buffer_test_execution = true, --Experimental, run tests directly from buffer
                noBuild = true,
                icons = {
                    passed = "",
                    skipped = "",
                    failed = "",
                    success = "",
                    reload = "",
                    test = "",
                    sln = "󰘐",
                    project = "󰘐",
                    dir = "",
                    package = "",
                },
                mappings = {
                    run_test_from_buffer = { lhs = "<leader>r", desc = "run test from buffer" },
                    peek_stack_trace_from_buffer = { lhs = "<leader>p", desc = "peek stack trace from buffer" },
                    filter_failed_tests = { lhs = "<leader>fe", desc = "filter failed tests" },
                    debug_test = { lhs = "<leader>d", desc = "debug test" },
                    go_to_file = { lhs = "g", desc = "go to file" },
                    run_all = { lhs = "<leader>R", desc = "run all tests" },
                    run = { lhs = "<leader>r", desc = "run test" },
                    peek_stacktrace = { lhs = "<leader>p", desc = "peek stacktrace of failed test" },
                    expand = { lhs = "o", desc = "expand" },
                    expand_node = { lhs = "E", desc = "expand node" },
                    expand_all = { lhs = "-", desc = "expand all" },
                    collapse_all = { lhs = "W", desc = "collapse all" },
                    close = { lhs = "q", desc = "close testrunner" },
                    refresh_testrunner = { lhs = "<C-r>", desc = "refresh testrunner" },
                },
                --- Optional table of extra args e.g "--blame crash"
                additional_args = {},
            },
        },
        -- keys specified in after/ftplugin/cs.lua
        -- keys = function()
        --     local dotnet = require("easy-dotnet")
        --     local diagnostics = require("easy-dotnet.actions.diagnostics")
        --     return {
        --         {
        --             "<leader>rb",
        --             function()
        --                 dotnet.build()
        --             end,
        --             desc = "build",
        --         },
        --         {
        --             "<leader>rc",
        --             function()
        --                 dotnet.clean()
        --             end,
        --             desc = "clean",
        --         },
        --         {
        --             "<leader>rd",
        --             function()
        --                 diagnostics.get_workspace_diagnostics()
        --             end,
        --             desc = "diagnostics",
        --         },
        --     }
        -- end,
    },
    -- {
    --     "EthanJWright/vs-tasks.nvim",
    --     dependencies = {
    --         "nvim-lua/popup.nvim",
    --         "nvim-lua/plenary.nvim",
    --         "nvim-telescope/telescope.nvim",
    --     },
    --     keys = {
    --         {
    --             "<leader>rt",
    --             function()
    --                 require("telescope").extensions.vstask.tasks()
    --             end,
    --             desc = "tasks",
    --         }
    --     },
    -- }
}
