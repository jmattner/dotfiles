return {
    { "nvim-mini/mini.nvim", version = false },
    { "nvim-tree/nvim-web-devicons", version = false },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {},
        keys = function()
            local wk = require("which-key")
            wk.add({
                { "<leader>a", group = "AI" },
                { "<leader>c", group = "config" },
                { "<leader>d", group = "debug" },
                { "<leader>g", group = "git" },
                { "<leader>j", hidden = true },
                { "<leader>k", hidden = true },
                { "<leader>p", group = "pickers" },
                { "<leader>m", group = "menus" },
                { "<leader>r", group = "run" },
                { "<leader>t", group = "test" },
                { "<leader>x", group = "diagnostics" },
                { "<leader>z", group = "sessions" },
                { "gr", group = "lsp" },
            })
            return {
                {
                    "<leader>?",
                    function()
                        require("which-key").show({ global = false })
                    end,
                    desc = "Buffer Local Keymaps",
                },
            }
        end,
    },
}
