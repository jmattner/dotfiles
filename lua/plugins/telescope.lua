return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = {
        "nvim-lua/plenary.nvim"
    },
    keys = function()
        local builtin = require("telescope.builtin")
        return {
            { "<leader>pp", builtin.builtin,    desc = "Pickers" },
            { "<leader>pf", builtin.find_files, desc = "Files" },
            {
                "<leader>pws",
                function()
                    local word = vim.fn.expand("<cword>")
                    builtin.grep_string({ search = word })
                end,
                desc = "Word Search"
            },
            {
                "<leader>pWs",
                function()
                    local word = vim.fn.expand("<cWORD>")
                    builtin.grep_string({ search = word })
                end,
                desc = "Word (outer) Search"
            },
            {
                "<leader>ps",
                function()
                    builtin.grep_string({ search = vim.fn.input("Grep > ") })
                end,
                desc = "Text"
            },
            { "<leader>pt", builtin.colorscheme,          desc = "Themes" },
            { "<leader>pg", builtin.git_commits,          desc = "Commits" },
            { "<leader>ph", builtin.help_tags,            desc = "Help" },

            -- lsp things
            { "<leader>pd", builtin.lsp_definitions,      desc = "Definition" },
            { "<leader>pD", builtin.lsp_type_definitions, desc = "Type Definition" },
            { "<leader>pr", builtin.lsp_references,       desc = "Reference" },
            { "<leader>pi", builtin.lsp_implementations,  desc = "Implementation" },
            { "<leader>pz", print("asdf"), desc = "Test" },
        }
    end,
    opts = {
        pickers = {
            lsp_references = {
                layout_strategy = "vertical",
                layout_config = {
                    width = 0.95,
                    height = 0.95,
                    anchor = "S",
                },
                path_display = {
                    shorten = 2
                },
                fname_width = 0.5,
                -- show_line = false,
            },
            diagnostics = {
                path_display = function(opts, path)
                    local tail = require("telescope.utils").path_tail(path)
                    return string.format("%s (%s)", tail, path)
                end,
            },
        },
    },
}
