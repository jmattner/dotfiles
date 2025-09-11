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
                javascript = { "prettierd", "prettier", stop_after_first = true },
                typescript = { "prettierd", "prettier", stop_after_first = true },
                typescriptreact = { "prettierd", "prettier", stop_after_first = true },
                css = { "prettierd", "prettier", stop_after_first = true },
                html = { "prettierd", "prettier", stop_after_first = true },
                yaml = { "prettierd", "prettier", stop_after_first = true },
            },
        },
        config = function(_, opts)
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
                        typescriptreact = "tsx",
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
            require("conform").setup(opts);
        end,
    },
    {
        "zapling/mason-conform.nvim",
        dependencies = { "stevearc/conform.nvim" },
    },
}
