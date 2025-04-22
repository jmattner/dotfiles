return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        dependencies = {
            "nvim-lua/plenary.nvim"
        },
        keys = function()
            local builtin = require("telescope.builtin")

            return {
                { "<leader>pp", builtin.builtin,    desc = "pickers" },
                { "<leader>pf", builtin.find_files, desc = "files" },
                {
                    "<leader>px",
                    function()
                        builtin.find_files({
                            no_ignore = true,
                            search_file = "*.g.cs",
                        })
                    end,
                    desc = "generated"
                },
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
                { "<leader>pt", builtin.colorscheme,          desc = "themes" },
                { "<leader>pg", builtin.git_bcommits,         desc = "git history" },
                { "<leader>ph", builtin.help_tags,            desc = "help" },
                { "<leader>pb", builtin.buffers,              desc = "buffers" },

                -- lsp things
                { "<leader>pd", builtin.lsp_definitions,      desc = "definition" },
                { "<leader>pD", builtin.lsp_type_definitions, desc = "type Definition" },
                { "<leader>pr", builtin.lsp_references,       desc = "reference" },
                { "<leader>pi", builtin.lsp_implementations,  desc = "implementation" },

                { "<leader>gb", builtin.git_branches,         desc = "Branches" },
                { "<leader>gt", builtin.git_branches,         desc = "Git Stash" },
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
                        shorten = 2,
                    },
                    fname_width = 0.5,
                    -- show_line = false,
                },
                diagnostics = {
                    path_display = function(_, path)
                        local tail = require("telescope.utils").path_tail(path)
                        return string.format("%s (%s)", tail, path)
                    end,
                },
            },
            extensions = {
                csharpls_definition = {},
            },
        },
    },
    {
        "nvim-telescope/telescope-file-browser.nvim",
        dependencies = {
            "nvim-telescope/telescope.nvim",
            "nvim-lua/plenary.nvim"
        },
        keys = function()
            local browser = require("telescope").extensions.file_browser
            return {
                {
                    "<leader>pe",
                    function()
                        browser.file_browser({
                            path = "%:p:h",
                            select_buffer = true,
                        })
                    end,
                    desc = "File Explorer"
                },
            }
        end,
    }
}
