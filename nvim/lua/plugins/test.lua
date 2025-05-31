return {
    {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-neotest/nvim-nio",
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter",
            "Issafalcon/neotest-dotnet",
        },
        keys = function()
            return {
                {
                    "<leader>tt",
                    function()
                        require("neotest").summary.toggle()
                    end,
                    desc = "summary"
                },
                {
                    "<leader>tl",
                    function()
                        require("neotest").output_panel.toggle()
                    end,
                    desc = "log"
                },
                {
                    "<leader>tx",
                    function()
                        require("neotest").output_panel.clear()
                    end,
                    desc = "clear log"
                },
                {
                    "<leader>tr",
                    function()
                        require("neotest").run.run()
                        -- require("neotest").run.run(vim.fn.expand("%"))
                    end,
                    desc = "run"
                },
                {
                    "<leader>td",
                    function()
                        require("neotest").run.run({ vim.fn.expand("%"), suite = false, strategy = "dap" })
                    end,
                    desc = "debug"
                },
                {
                    "<leader>ta",
                    function()
                        require("neotest").run.run({ suite = true })
                    end,
                    desc = "run all"
                },
                {
                    "<leader>ts",
                    function()
                        require("neotest").run.stop()
                    end,
                    desc = "stop"
                },
            }
        end,
        opts = function(_, opts)
            opts = opts or {}
            return {
                adapters = {
                    require("neotest-dotnet")({
                        discovery_root = "solution",
                    })
                },
                -- running = {
                --     concurrent = false,
                -- },
                summary = {
                    count = true,
                    open = "botright vsplit | vertical resize 60",
                },
            }
        end,
    },
    {
        "Issafalcon/neotest-dotnet",
    },
}
