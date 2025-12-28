---@module 'mini.sessions'

return {
    {
        "nvim-mini/mini.sessions",
        -- dev = true,
        version = false,
        dependencies = {
            -- depend on noice so session load happens after lsp progress notifications are disabled
            { "folke/noice.nvim" },
        },
        -- do key binding in config because explosions?
        -- keys = {
        --     {
        --         "<leader>za",
        --         function()
        --             require("mini.sessions").write("Session.vim", {})
        --         end,
        --         desc = "Create Session",
        --     },
        -- },
        opts = {
            autoread = true,
            autowrite = true,
            file = "Session.vim",
            verbose = { read = true, write = true, delete = true },
        },
        config = function(_, opts)
            local sessions = require("mini.sessions")

            vim.keymap.set("n", "<leader>za", function()
                sessions.write("Session.vim", {})
            end, { desc = "Create Session" })

            sessions.setup(opts)
        end,
    },
}
