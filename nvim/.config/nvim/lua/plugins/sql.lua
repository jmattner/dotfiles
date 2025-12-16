return {
    {
        {
            "tpope/vim-dadbod",
            lazy = true,
        },
        {
            "kristijanhusak/vim-dadbod-completion",
            ft = { "sql", "mysql", "plsql" },
            lazy = true,
        },
        {
            "kristijanhusak/vim-dadbod-ui",
            dependencies = {
                "tpope/vim-dadbod",
                "kristijanhusak/vim-dadbod-completion",
            },
            cmd = {
                "DBUI",
                "DBUIToggle",
                "DBUIAddConnection",
                "DBUIFindBuffer",
            },
            init = function()
                -- Your DBUI configuration
                vim.g.db_ui_use_nerd_fonts = 1
            end,
            keys = {
                { "<leader>ms", "<cmd>DBUIToggle<cr>", desc = "DadBod UI" },
            },
        },
    },
}
