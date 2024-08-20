return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = {
        "nvim-lua/plenary.nvim"
    },
    keys = function()
        local builtin = require("telescope.builtin")
        return {
            {
                "<leader>pf", builtin.find_files, desc = "Search Files"
            },
            {
                "<leader>pws",
                function()
                    local word = vim.fn.expand("<cword>")
                    builtin.grep_string({ search = word })
                end,
                desc = "Search Word"
            },
            {
                "<leader>pWs",
                function()
                    local word = vim.fn.expand("<cWORD>")
                    builtin.grep_string({ search = word })
                end,
                desc = "Search Word (outer)"
            },
            {
                "<leader>ps",
                function()
                    builtin.grep_string({ search = vim.fn.input("Grep > ") })
                end,
                desc = "Search Text"
            },
            { "<leader>pt", builtin.colorscheme, desc = "Search Themes" },
            { "<leader>pg", builtin.git_commits, desc = "Search Commits" },
            { "<leader>vh", builtin.help_tags,   desc = "View Help" }
        }
    end,
    opts = {}
}
