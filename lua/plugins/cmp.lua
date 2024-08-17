return {
    {
        "hrsh7th/nvim-cmp",
        event = { "InsertEnter", "CmdlineEnter" },
        dependencies = { "garymjr/nvim-snippets" },
        config = function()
            local cmp = require("cmp")

            cmp.setup.cmdline("/", {               -- sources for search
                mapping = cmp.mapping.preset.cmdline(),
                sources = { { name = "buffer" } }, -- current buffer text
            })

            cmp.setup.cmdline({ ":" }, { -- sources for cmdline
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    { name = "cmdline" },         -- available commands
                    { name = "cmdline_history" }, -- previous commands
                    { name = "async_path" },      -- filesystem path
                    { name = "buffer" },          -- current buffer text
                },
            })

            cmp.setup({
                sources = {
                    { name = "nvim_lua" },
                    {
                        name = "lazydev",
                        group_index = 0,
                    },
                    { name = "nvim_lsp" },
                    { name = "dap" },
                    { name = "buffer" },     -- current buffer text
                    { name = "async_path" }, -- filesystem path
                },
                mapping = {
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<C-d>"] = cmp.mapping.scroll_docs(4),
                    ["<C-u>"] = cmp.mapping.scroll_docs(-4),

                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item()),
                    ["<S-Tab>"] = cmp.mapping(cmp.mapping.select_prev_item()),
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                ---@diagnostic disable-next-line: missing-fields
                formatting = {
                    fields = { "abbr", "kind", "menu" },
                    format = require("lspkind").cmp_format({
                        mode = "symbol",       -- Show only symbol annotations
                        maxwidth = 50,         -- Prevent the popup from showing more than provided characters
                        ellipsis_char = "...", -- Excedent character in popup show this var
                    }),
                },
            })

            vim.diagnostic.config({
                virtual_text = { prefix = ' ● ' },
                underline = false,
                update_in_insert = true,
            })
        end,
    },
    {
        "garymjr/nvim-snippets",
        dependencies = {
            "rafamadriz/friendly-snippets",
            "onsails/lspkind.nvim",
        },
        opts = {
            friendly_snippets = true,
        },
        keys = {
            {
                "<Tab>",
                function()
                    if vim.snippet.active({ direction = 1 }) then
                        vim.schedule(function()
                            vim.snippet.jump(1)
                        end)
                        return
                    end
                    return "<Tab>"
                end,
                expr = true,
                silent = true,
                mode = "i",
            },
            {
                "<Tab>",
                function()
                    vim.schedule(function()
                        vim.snippet.jump(1)
                    end)
                end,
                expr = true,
                silent = true,
                mode = "s",
            },
            {
                "<S-Tab>",
                function()
                    if vim.snippet.active({ direction = -1 }) then
                        vim.schedule(function()
                            vim.snippet.jump(-1)
                        end)
                        return
                    end
                    return "<S-Tab>"
                end,
                expr = true,
                silent = true,
                mode = { "i", "s" },
            },
        },
    },
    { "rafamadriz/friendly-snippets" },
    { "onsails/lspkind.nvim" },
    { "hrsh7th/cmp-nvim-lsp", event = { "InsertEnter", "CmdlineEnter" } },
    { "hrsh7th/cmp-buffer", event = { "InsertEnter", "CmdlineEnter" } },
    { "hrsh7th/cmp-cmdline", event = { "InsertEnter", "CmdlineEnter" } },
    { "hrsh7th/cmp-nvim-lua", event = { "InsertEnter", "CmdlineEnter" } },
    { "FelipeLema/cmp-async-path", event = { "InsertEnter", "CmdlineEnter" } },
    { "dmitmel/cmp-cmdline-history", keys = ":" },
}
