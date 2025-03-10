return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            { "williamboman/mason.nvim" },
        },
        config = function()
            require("mason").setup()

            vim.api.nvim_create_autocmd("LspAttach", {
                desc = "LSP Actions",
                callback = function(args)
                    vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>",
                        { buffer = args.buf, desc = "Definition" })
                    vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>",
                        { buffer = args.buf, desc = "Declaration" })
                    -- set in trouble.nvim
                    -- vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>",
                    --     { buffer = event.buf, desc = "Implementation" })
                    vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>",
                        { buffer = args.buf, desc = "Type definition" })
                    -- set in trouble.nvim
                    -- vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>",
                    --     { buffer = event.buf, desc = "References" })
                    vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>",
                        { buffer = args.buf, desc = "Signature help" })
                    -- set in actions-preview
                    -- vim.keymap.set("n", "<leader>.", "<cmd>lua vim.lsp.buf.code_action()<cr>", { buffer = event.buf, desc = "Code actions" })
                    vim.keymap.set("n", "<leader>xr", "<cmd>lua vim.lsp.buf.rename()<cr>",
                        { buffer = args.buf, desc = "Rename" })
                end,
            })

            local signs = { Error = "✘", Warn = "▲", Hint = "⚑", Info = "»" }
            for type, icon in pairs(signs) do
                local hl = "DiagnosticSign" .. type
                vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
            end

            -- TODO - uncomment when this is resolved
            -- https://github.com/GodOfAvacyn/gdshader-lsp/issues/2
            -- require('lspconfig').gdshader_lsp.setup({
            --     cmd = { "gdshader_lsp" }
            -- })
        end,
    },
    {
        "williamboman/mason.nvim",
        opts = {
            PATH = "prepend",
            ui = { border = "rounded" },
            registries = {
                "github:mason-org/mason-registry",
                "github:Crashdummyy/mason-registry",
            },
        },
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            { "williamboman/mason.nvim" },
            { "Hoffs/omnisharp-extended-lsp.nvim" },
        },
        opts = function(_, opts)
            local rounded_borders = {
                ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
                ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
            }

            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            opts.ensure_installed = opts.ensure_installed or {}
            vim.list_extend(opts.ensure_installed, {
                "cssls",
                "docker_compose_language_service",
                "dockerls",
                "eslint",
                "html",
                "lua_ls",
                "marksman",
                "sqlls",
                "ts_ls",
            })

            opts.handlers = {
                function(server)
                    require("lspconfig")[server].setup({
                        capabilities = capabilities,
                        handlers = rounded_borders,
                    })
                end,
            }

            return opts
        end,
        config = function(_, opts)
            require("mason").setup({
                PATH = "prepend",
                ui = { border = "rounded" }
            })
            require("mason-lspconfig").setup(opts)
        end,
    },
    {
        "seblyng/roslyn.nvim",
        ft = "cs",
        opts = {},
    },
}
