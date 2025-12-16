return {
    {
        "romek-codes/bruno.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            {
                "folke/snacks.nvim",
                opts = { picker = { enabled = true } },
            },
        },
        opts = {
            -- collection_paths = {
            --     { name = "Main", path = "/path/to/folder/containing/collections/Documents/Bruno" },
            -- },
            picker = "snacks",
            show_formatted_output = true,
            suppress_formatting_errors = false,
        },
    },
    {
        "rest-nvim/rest.nvim",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            opts = function(_, opts)
                opts.ensure_installed = opts.ensure_installed or {}
                table.insert(opts.ensure_installed, "http")
            end,
        },
        keys = {

            { "<leader>mh", "<cmd>Rest open<cr>", desc = "Open http results" },
            -- other binds specified in ftplugin/http.lua
        },
        ---@type rest.Opts
        opts = {},
    },
}
