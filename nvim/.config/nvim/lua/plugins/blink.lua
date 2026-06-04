---@module 'blink.cmp'

return {
    "saghen/blink.cmp",
    dependencies = {
        "rafamadriz/friendly-snippets",
    },
    version = "*",
    ---@type blink.cmp.Config
    opts = {
        keymap = {
            ["<Tab>"] = {},
            ["<S-Tab>"] = {},
        },
        fuzzy = { implementation = "prefer_rust_with_warning" },
        sources = {
            default = { "lsp", "path", "snippets" },
            per_filetype = {
                codecompanion = { "codecompanion" },
                sql = { "dadbod", "snippets" },
            },
            providers = {
                dadbod = {
                    name = "dadbod",
                    enabled = true,
                    module = "vim_dadbod_completion.blink",
                },
            },
        },
    },
}
