return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        lazy = false,
        build = ":TSUpdate",
        init = function()
            vim.api.nvim_create_autocmd("FileType", {
                callback = function()
                    pcall(vim.treesitter.start)
                    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                end,
            })

            local ensureInstalled = {
                "angular",
                "bash",
                "c_sharp",
                "css",
                "dockerfile",
                "editorconfig",
                "gdscript",
                "gdshader",
                "godot_resource",
                "gitcommit",
                "gitignore",
                "helm",
                "html",
                "http",
                "javascript",
                "jsdoc",
                "json",
                "latex",
                "lua",
                "markdown",
                "markdown_inline",
                "mermaid",
                "python",
                "query",
                "regex",
                "rust",
                "scss",
                "typescript",
                "vim",
                "yaml",
            }
            local alreadyInstalled = require("nvim-treesitter.config").get_installed()
            local parsersToInstall = vim.iter(ensureInstalled)
                :filter(function(parser)
                    return not vim.tbl_contains(alreadyInstalled, parser)
                end)
                :totable()
            require("nvim-treesitter").install(parsersToInstall)
        end,
    },
}
