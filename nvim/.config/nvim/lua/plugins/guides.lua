return {
    {
        "tris203/precognition.nvim",
        opts = {},
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        ---@module "ibl"
        ---@type ibl.config
        opts = {
            scope = {
                enabled = false,
            },
            indent = {
                highlight = {
                    "CursorColumn",
                    "Whitespace",
                },
                char = "",
            },
            whitespace = {
                remove_blankline_trail = false,
                highlight = {
                    "CursorColumn",
                    "Whitespace",
                },
            },
        },
    },
    {
        'echasnovski/mini.indentscope',
        version = false,
        opts = {
            -- draw = {
            --     animation = function(s, n)
            --         return 0
            --     end,
            -- },
            symbol = "│",
            options = { try_as_border = true },
        },
    },
}
