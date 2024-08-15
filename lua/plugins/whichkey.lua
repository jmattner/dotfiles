return {
    { 'echasnovski/mini.nvim',       version = false },
    { 'nvim-tree/nvim-web-devicons', version = false },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {
        },
        keys = {
            {
                "<leader>?",
                function()
                    require("which-key").show({ global = false })
                end,
                desc = "Buffer Local Keymaps"
            }
        }
    }
}
