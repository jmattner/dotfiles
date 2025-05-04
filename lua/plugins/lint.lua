return {
    {
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
                lua = { "luac" },
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
        -- remove when https://github.com/rshkarin/mason-nvim-lint/issues/22 is fixed
        commit = "910dadb99cb2bf0d5176026c7a4ab1861c4e561f",
        opts = {
            ensure_installed = {
                "luac",
                "stylua",
            },
            automatic_installation = true,
            quiet_mode = false,
        }
    },
}
