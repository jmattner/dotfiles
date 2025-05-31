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
    },
}
