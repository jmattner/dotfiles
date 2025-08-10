return {
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        init = function()
            vim.cmd([[colorscheme tokyonight-night]])
        end
    },
    {
        "tiagovla/tokyodark.nvim",
        priority = 1000,
        -- config = function()
        --     vim.cmd([[colorscheme tokyodark]])
        -- end,
    },

}
