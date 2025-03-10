return {
    {
        'MeanderingProgrammer/render-markdown.nvim',
        dependencies = {
            { 'nvim-treesitter/nvim-treesitter' },
            { 'nvim-tree/nvim-web-devicons' },
        },
        ---@module 'render-markdown'
        ---@type function|render.md.UserConfig
        opts = function()
            return {
                code = {
                    style = 'language',
                    width = 'block',
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
    --     "toppair/peek.nvim",
    --     event = { "VeryLazy" },
    --     build = "deno task --quiet build:fast",
    --     opts = {
    --         app = { "firefox", "--new-window" },
    --     },
    --     keys = {
    --         {
    --             "<leader>mp",
    --             function()
    --                 local peek = require("peek")
    --                 if peek.is_open() then
    --                     peek.close()
    --                 else
    --                     peek.open()
    --                 end
    --             end,
    --             desc = "Preview",
    --         },
    --     },
    --     config = function(_, opts)
    --         require("peek").setup(opts)
    --         vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
    --         vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
    --     end,
    -- },
}
