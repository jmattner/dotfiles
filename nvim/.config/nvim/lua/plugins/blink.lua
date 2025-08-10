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
            ['<Tab>'] = {},
            ['<S-Tab>'] = {},
        },
        sources = {
            fuzzy = { implementation = "prefer_rust_with_warning" },
            default = { "lsp", "easy-dotnet", "path" },
            per_filetype = {
                codecompanion = { "codecompanion" },
            },
            providers = {
                ["easy-dotnet"] = {
                    name = "easy-dotnet",
                    enabled = true,
                    module = "easy-dotnet.completion.blink",
                    score_offset = 10000,
                    async = true,
                },
            },
        },
    },
}
