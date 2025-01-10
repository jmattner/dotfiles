return {
    { --* Adds the ability to use real formatters (not an LSP) *--
        "stevearc/conform.nvim",
        keys = {
            {
                "<leader>f",
                function()
                    require("conform").format({ async = true, lsp_format = "fallback" })
                end,
                mode = "",
                desc = "Format buffer",
            },
        },
        opts = {
            notify_on_error = false,
            formatters_by_ft = {
                cs = { "csharpier" },
                javascript = { "biome" },
                json = { "biome" },
                jsonc = { "biome" },
                lua = { "stylua" },
                markdown = { "markdownlint" },
                sql = { "sqlfmt" },
            },
        },
        config = function()
            require("conform").formatters.injected = {
                options = {
                    ignore_errors = false,
                    lang_to_ext = {
                        bash = "sh",
                        c = "c",
                        css = "css",
                        cpp = "cpp",
                        c_sharp = "cs",
                        elixir = "exs",
                        javascript = "js",
                        julia = "jl",
                        latex = "tex",
                        markdown = "md",
                        python = "py",
                        ruby = "rb",
                        rust = "rs",
                        teal = "tl",
                        typescript = "ts",
                        asm = "asm",
                        json = "json",
                        toml = "toml",
                        yaml = "yml",
                        xml = "xml",
                        lua = "lua",
                        html = "html",
                        vim = "vim",
                    },
                },
            }
        end,
    },
    {
        "mfussenegger/nvim-lint",
        event = "VeryLazy",
        config = function()
            require("lint").linters_by_ft = {
                markdown = { "markdownlint", "typos" },
                vim = { "vint", "typos" },
                lua = { "typos" },
                sh = { "typos" },
                sql = { "sqlfluff" },
            }
        end,
        init = function()
            vim.api.nvim_create_autocmd({ "BufEnter", "TextChanged" }, {
                callback = function()
                    require("lint").try_lint()
                end,
            })
        end,
    },
    {
        "rshkarin/mason-nvim-lint",
        opts = {
            quiet_mode = true,
            ensure_installed = {
                "csharpier",
                "gdtoolkit",
                "markdownlint",
                "sqlfluff",
                "sqlfmt",
                "stylua",
                "typos",
                "vint",
            },
        }
    },
}
