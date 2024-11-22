return {
    { 'echasnovski/mini.nvim',       version = false },
    { 'nvim-tree/nvim-web-devicons', version = false },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {
        },
        keys = function()
            local wk = require("which-key")
            wk.add({
                { "<leader>d", group = "debug" },
                { "<leader>g", group = "git" },
                { "<leader>j", hidden = true },
                { "<leader>k", hidden = true },
                { "<leader>p", group = "pickers" },
                { "<leader>m", group = "menus" },
                { "<leader>m", group = "run" },
                { "<leader>z", group = "sessions" },
            })
            return {
                {
                    "<leader>?",
                    function()
                        require("which-key").show({ global = false })
                    end,
                    desc = "Buffer Local Keymaps"
                },
            }
        end
    }
}
