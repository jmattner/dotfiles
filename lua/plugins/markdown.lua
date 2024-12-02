return {
    -- {
    --     'MeanderingProgrammer/render-markdown.nvim',
    --     dependencies = {
    --         'nvim-treesitter/nvim-treesitter',
    --         'nvim-tree/nvim-web-devicons',
    --     },
    --     opts = {},
    -- },
    {
        "toppair/peek.nvim",
        event = { "VeryLazy" },
        build = "deno task --quiet build:fast",
        opts = {
            app = { "chrome", "--new-window" },
        },
        keys = {
            {
                "<leader>mp",
                function()
                    local peek = require("peek")
                    if peek.is_open() then
                        peek.close()
                    else
                        peek.open()
                    end
                end,
                desc = "Preview",
            },
        },
        config = function(_, opts)
            require("peek").setup(opts)
            vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
            vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
        end,
    },
}
