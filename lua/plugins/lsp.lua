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
                    vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", { buffer = event.buf })
                    vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", { buffer = event.buf })
                    vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", { buffer = event.buf })
                    vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", { buffer = event.buf })
                    vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", { buffer = event.buf })
                    vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", { buffer = event.buf })
                    vim.keymap.set("n", "<F4>", "<cmd>lua require('tiny-code-action').code_action()<cr>", { buffer = event.buf }) -- Code actions with telescope UI and preview
                    vim.keymap.set("n", "<leader>r", "<cmd>lua vim.lsp.buf.rename()<cr>", { buffer = event.buf })
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
        end,
    },
    {
        "williamboman/mason.nvim",
        opts = {
            ui = { border = "rounded" }
        },
    },
    {
        "williamboman/mason-lspconfig.nvim",
        opts = function(_, opts)
            local default_setup = function(server)
                require("lspconfig")[server].setup({
                    capabilities = require("cmp_nvim_lsp").default_capabilities(),
                })
            end

            opts.handlers = { default_setup }

            opts.ensure_installed = opts.ensure_installed or {}
            vim.list_extend(opts.ensure_installed, {
                "biome",
                "cssls",
                "docker_compose_language_service",
                "dockerls",
                "html",
                "lua_ls",
                "marksman",
            })
        end,
    },
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
