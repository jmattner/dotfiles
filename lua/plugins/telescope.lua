return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = {
        'nvim-lua/plenary.nvim'
    },
    keys = {
        { "<leader>pf", (require("telescope.builtin").find_files), desc = "Search Files" },
        {
            "<leader>pws",
            function()
                local word = vim.fn.expand("<cword>")
                require("telescope.builtin").grep_string({ search = word })
            end,
            desc = "Search Word"
        },
        {
            "<leader>pWs",
            function()
                local word = vim.fn.expand("<cWORD>")
                require("telescope.builtin").grep_string({ search = word })
            end,
            desc = "Search Word (outer)"
        },
        {
            "<leader>ps",
            function()
                require("telescope.builtin").grep_string({ search = vim.fn.input("Grep > ") })
            end,
            desc = "Search Text"
        },
        { "<leader>pt", (require("telescope.builtin").colorscheme), desc = "Search Themes" },
        { "<leader>pg", (require("telescope.builtin").git_commits), desc = "Search Commits" },
        { "<leader>vh", (require("telescope.builtin").help_tags),  desc = "View Help" }
    },
    opts = {}
}
