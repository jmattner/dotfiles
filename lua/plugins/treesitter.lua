return {
    {
        'nvim-treesitter/nvim-treesitter',
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
                "yaml"
            })
            opts.highlight = {
                enable = true,
                additional_vim_regex_highlighting = false
            }
        end,
    }
}
