return {
    {
        "MeanderingProgrammer/render-markdown.nvim",
        dependencies = {
            { "nvim-treesitter/nvim-treesitter" },
            { "nvim-tree/nvim-web-devicons" },
        },
        ft = { "markdown", "codecompanion" },
        ---@module 'render-markdown'
        ---@type function|render.md.UserConfig
        opts = function()
            return {
                code = {
                    style = "language",
                    width = "block",
                    left_pad = 4,
                    right_pad = 4,
                },
                -- custom_handlers = {
                --     mermaid = {
                --         parse = require('mermaid').parse_mermaid
                --     },
                -- },
            }
        end,
    },
    -- {
    --     dir = '~/Development/nvim-plugins/mermaid.nvim',
    --     keys = {
    --         {
    --             '<leader>c',
    --             function()
    --                 require('mermaid').refresh()
    --             end,
    --             desc = "refresh mermaid"
    --         }
    --     },
    -- },
    -- {
    --     "selimacerbas/markdown-preview.nvim",
    --     dependencies = { "selimacerbas/live-server.nvim" },
    --     opts = {
    --         mermaid_renderer = "rust",
    --     },
    --     keys = {
    --         {
    --             "<leader>mm",
    --             "<cmd>MarkdownPreview<cr>",
    --             desc = "Markdown: Toggle preview",
    --         },
    --     },
    -- },
}
