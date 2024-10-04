return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            { "nvim-treesitter/nvim-treesitter" },
            { "williamboman/mason.nvim" },
            { "williamboman/mason-lspconfig.nvim" },
            -- { "jay-babu/mason-nvim-dap.nvim" },
            { "rshkarin/mason-nvim-lint" },
        },
        config = function()
            vim.api.nvim_create_autocmd("LspAttach", {
                desc = "LSP Actions",
                callback = function(event)
                    --* Lsp kmaps *--
                    vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", { buffer = event.buf, desc = "Definition" })
                    vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", { buffer = event.buf, desc = "Declaration" })
                    vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", { buffer = event.buf, desc = "Implementation" })
                    vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", { buffer = event.buf, desc = "Type definition" })
                    vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", { buffer = event.buf, desc = "References" })
                    vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", { buffer = event.buf, desc = "Signature help" })
                    -- set in actions-preview
                    -- vim.keymap.set("n", "<leader>.", "<cmd>lua vim.lsp.buf.code_action()<cr>", { buffer = event.buf, desc = "Code actions" })
                    vim.keymap.set("n", "<leader>r", "<cmd>lua vim.lsp.buf.rename()<cr>", { buffer = event.buf, desc = "Rename" })
                end,
            })

            --* Rounded definitions borders *--
            vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })

            --* change signs icons in the signcolumn *--
            local signs = { Error = "✘", Warn = "▲", Hint = "⚑", Info = "»" }
            for type, icon in pairs(signs) do
                local hl = "DiagnosticSign" .. type
                vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
            end

            require("mason-lspconfig").setup_handlers {
                function (server_name)
                    require("lspconfig")[server_name].setup {}
                end,
                -- ["rust_analyzer"] = function ()
                --     require("rust-tools").setup {}
                -- end
            }
        end,
    },
    {
        "williamboman/mason.nvim",
        opts = {
            -- install_root_dir = vim.fn.expand(vim.fn.stdpath("data") .. "/mason"),
            PATH = "prepend",
            ui = { border = "rounded" }
        },
    },
    {
        "williamboman/mason-lspconfig.nvim",
        opts = function(_, opts)
            -- local mason_path = vim.fn.stdpath("data") .. "/mason/bin/"

            opts.ensure_installed = opts.ensure_installed or {}
            vim.list_extend(opts.ensure_installed, {
                "biome",
                "cssls",
                "csharp_ls",
                "docker_compose_language_service",
                "dockerls",
                "html",
                "lua_ls",
                "marksman",
                "sqlls",
            })
        end,
    },
    -- {
    --     "aznhe21/actions-preview.nvim",
    --     dependencies = {
    --         { "nvim-telescope/telescope.nvim" },
    --     },
    --     keys = function()
    --         local actionsPreview = require("actions-preview")
    --         return {
    --             { "<leader>.", actionsPreview.code_actions, mode = { "v", "n" }, desc = "THIS ONE" }
    --         }
    --     end,
    --     opts = {},
    -- },
    -- {
    --     "jay-babu/mason-nvim-dap.nvim",
    --     opts = {
    --         ensure_installed = {
    --             "debugpy",
    --             "cpptools"
    --         }
    --     },
    -- },
}
