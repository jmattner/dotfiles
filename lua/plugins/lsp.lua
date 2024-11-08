return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            { "nvim-treesitter/nvim-treesitter" },
            { "williamboman/mason.nvim" },
            { "williamboman/mason-lspconfig.nvim" },
            { "rshkarin/mason-nvim-lint" },
        },
        config = function()
            vim.api.nvim_create_autocmd("LspAttach", {
                desc = "LSP Actions",
                callback = function(event)
                    --* Lsp kmaps *--
                    vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>",
                        { buffer = event.buf, desc = "Definition" })
                    vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>",
                        { buffer = event.buf, desc = "Declaration" })
                    -- set in trouble.nvim
                    -- vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>",
                    --     { buffer = event.buf, desc = "Implementation" })
                    vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>",
                        { buffer = event.buf, desc = "Type definition" })
                    -- set in trouble.nvim
                    -- vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>",
                    --     { buffer = event.buf, desc = "References" })
                    vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>",
                        { buffer = event.buf, desc = "Signature help" })
                    -- set in actions-preview
                    -- vim.keymap.set("n", "<leader>.", "<cmd>lua vim.lsp.buf.code_action()<cr>", { buffer = event.buf, desc = "Code actions" })
                    vim.keymap.set("n", "<leader>r", "<cmd>lua vim.lsp.buf.rename()<cr>",
                        { buffer = event.buf, desc = "Rename" })
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
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            {
                "williamboman/mason.nvim",
                opts = {
                    PATH = "prepend",
                    ui = { border = "rounded" }
                },
            },
        },
        opts = function(_, opts)
            opts.ensure_installed = opts.ensure_installed or {}
            vim.list_extend(opts.ensure_installed, {
                -- "biome",
                "cssls",
                "csharp_ls",
                -- TODO - keep an eye on omnisharp fixes
                -- https://github.com/OmniSharp/omnisharp-roslyn/issues/2574
                -- https://github.com/neovim/neovim/pull/29196
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
                        capabilities = require("cmp_nvim_lsp").default_capabilities(),
                    })
                end,
                -- ["biome"] = function()
                --     local util = require("lspconfig.util")
                --     vim.print(string.format('=== biome config'))
                --     require("lspconfig").biome.setup({
                --         capabilities = require("cmp_nvim_lsp").default_capabilities(),
                --         cmd = {
                --             "biome",
                --             "lsp-proxy",
                --         },
                --         filetypes = {
                --             "astro",
                --             "css",
                --             "graphql",
                --             "javascript",
                --             "javascriptreact",
                --             "json",
                --             "jsonc",
                --             "svelte",
                --             "typescript",
                --             "typescript.tsx",
                --             "typescriptreact",
                --             "vue",
                --         },
                --         root_dir = function(fname)
                --             return util.root_pattern("biome.json", "biome.jsonc")(fname)
                --                 or util.find_package_json_ancestor(fname)
                --                 or util.find_node_modules_ancestor(fname)
                --                 or util.find_git_ancestor(fname)
                --         end,
                --         single_file_support = true,
                --     })
                -- end,
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
}
