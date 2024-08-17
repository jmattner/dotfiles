return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        opts = function(_, opts)
            opts.ensure_installed = opts.ensure_installed or {}
            vim.list_extend(opts.ensure_installed, {
                "query",
                "angular",
                "c_sharp",
                "css",
                "dockerfile",
                "editorconfig",
                "gitcommit",
                "gitignore",
                "html",
                "http",
                "javascript",
                "jsdoc",
                "json",
                "lua",
                "scss",
                "typescript",
                "vim",
                "yaml"
            })
            opts.highlight = {
                enable = true,
                additional_vim_regex_highlighting = false
            }
            opts.indent = { enable = true }
            opts.matchup = { enable = true }
            opts.incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<C-space>",
                    node_incremental = "<C-space>",
                    scope_incremental = false,
                    node_decremental = "<bs>",
                }
            }
        end
    }
}
