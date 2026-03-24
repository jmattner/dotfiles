return {
    {
        "zbirenbaum/copilot.lua",
        -- dependencies = {
        --     {
        --         "copilotlsp-nvim/copilot-lsp", -- for NES functionality
        --         init = function()
        --             vim.g.copilot_nes_debounce = 500
        --             vim.lsp.enable("copilot_ls")
        --         end,
        --     },
        -- },
        cmd = "Copilot",
        event = "InsertEnter",
        opts = {
            suggestion = {
                enabled = true,
                hide_during_completion = false,
                auto_trigger = true,
                keymap = {
                    accept = "<S-Tab>",
                    accept_word = "<Tab>",
                },
            },
            panel = {
                enabled = false,
            },
            nes = {
                enabled = false,
                -- enabled = true,
                -- keymap = {
                --     accept_and_goto = "<leader><Tab>",
                --     accept = false,
                --     dismiss = "<Esc>",
                -- },
            },
        },
    },
    {
        "nvim-mini/mini.diff",
        config = function()
            local diff = require("mini.diff")
            diff.setup({
                -- Disabled by default
                source = diff.gen_source.none(),
            })
        end,
    },
    {
        "nickjvandyke/opencode.nvim",
        dependencies = {
            -- Recommended for `ask()` and `select()`.
            -- Required for `snacks` provider.
            ---@module 'snacks' <- Loads `snacks.nvim` types for configuration intellisense.
            { "folke/snacks.nvim" },
        },
        config = function()
            ---@type opencode.Opts
            vim.g.opencode_opts = {
                -- Your configuration, if any. Goto definition on the type or field for details.
            }

            -- Required for `opts.events.reload`.
            vim.o.autoread = true

            -- Recommended/example keymaps.
            vim.keymap.set({ "n", "x" }, "<C-a>", function()
                require("opencode").ask("@this: ", { submit = true })
            end, { desc = "Ask opencode…" })
            vim.keymap.set({ "n", "x" }, "<C-x>", function()
                require("opencode").select()
            end, { desc = "Execute opencode action…" })
            vim.keymap.set({ "n", "t" }, "<leader>ma", function()
                require("opencode").toggle()
            end, { desc = "Toggle opencode" })

            vim.keymap.set({ "n", "x" }, "go", function()
                return require("opencode").operator("@this ")
            end, { desc = "Add range to opencode", expr = true })
            vim.keymap.set("n", "goo", function()
                return require("opencode").operator("@this ") .. "_"
            end, { desc = "Add line to opencode", expr = true })

            vim.keymap.set("n", "<S-C-u>", function()
                require("opencode").command("session.half.page.up")
            end, { desc = "Scroll opencode up" })
            vim.keymap.set("n", "<S-C-d>", function()
                require("opencode").command("session.half.page.down")
            end, { desc = "Scroll opencode down" })

            -- You may want these if you use the opinionated `<C-a>` and `<C-x>` keymaps above — otherwise consider `<leader>o…` (and remove terminal mode from the `toggle` keymap).
            vim.keymap.set("n", "+", "<C-a>", { desc = "Increment under cursor", noremap = true })
            vim.keymap.set("n", "-", "<C-x>", { desc = "Decrement under cursor", noremap = true })
        end,
    },
    -- {
    --     "olimorris/codecompanion.nvim",
    --     dependencies = {
    --         "nvim-lua/plenary.nvim",
    --         "nvim-treesitter/nvim-treesitter",
    --     },
    --     keys = {
    --         { "<leader>aa", "<cmd>CodeCompanionActions<cr>", desc = "CodeCompanion Actions" },
    --         { "<leader>ac", "<cmd>CodeCompanionChat Toggle<cr>", desc = "CodeCompanion Chat" },
    --     },
    --     opts = {
    --         interactions = {
    --             chat = {
    --                 adapter = "opencode",
    --             },
    --             inline = {
    --                 adapter = "copilot",
    --             },
    --             cmd = {
    --                 adapter = "copilot",
    --             },
    --         },
    --         display = {
    --             action_palette = {
    --                 provider = "snacks",
    --                 opts = {
    --                     show_default_actions = true,
    --                     show_default_prompt_library = true,
    --                 },
    --             },
    --         },
    --     },
    -- },
}
