return {
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        -- init = function()
        --     vim.cmd([[colorscheme tokyonight-night]])
        -- end
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        lazy = false,
        priority = 1000,
        opts = {
            flavour = "mocha",
            show_end_of_buffer = true,
        },
        init = function()
            vim.cmd([[colorscheme catppuccin]])
        end
    },
}
