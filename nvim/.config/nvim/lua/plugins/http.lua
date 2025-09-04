return {
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
            { "<leader>rh", "<cmd>Rest run<cr>",  desc = "Run request under the cursor" },
        },
        setup = function()
        end,
    },
}
