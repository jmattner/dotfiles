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
        "zapling/mason-conform.nvim",
        dependencies = { "stevearc/conform.nvim" },
    },
}
