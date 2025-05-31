return {
    -- TODO - make this work
    {
        "mfussenegger/nvim-lint",
        event = "VeryLazy",
        config = function()
            require("lint").linters_by_ft = {
                lua = { "selene" },
            }
        end,
        init = function()
            vim.api.nvim_create_autocmd({ "BufEnter", "TextChanged" }, {
                callback = function()
                    require("lint").try_lint()
                end,
            })
        end,
    },
    {
        "rshkarin/mason-nvim-lint",
        -- remove when https://github.com/rshkarin/mason-nvim-lint/issues/22 is fixed
        commit = "910dadb99cb2bf0d5176026c7a4ab1861c4e561f",
        opts = {
            ensure_installed = {
                "luac",
                "stylua",
            },
            automatic_installation = true,
            quiet_mode = false,
        }
    },
}
