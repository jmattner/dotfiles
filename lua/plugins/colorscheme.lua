return {
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        init = function()
            -- load as default
            vim.cmd([[colorscheme tokyonight-night]])
        end
    }
}
