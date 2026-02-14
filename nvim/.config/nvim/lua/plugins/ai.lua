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
                enabled = true,
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
        "olimorris/codecompanion.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        keys = {
            { "<leader>aa", "<cmd>CodeCompanionActions<cr>", desc = "CodeCompanion Actions" },
            { "<leader>ac", "<cmd>CodeCompanionChat Toggle<cr>", desc = "CodeCompanion Chat" },
        },
        opts = {
            interactions = {
                chat = {
                    adapter = "opencode",
                },
                inline = {
                    adapter = "copilot",
                },
                cmd = {
                    adapter = "copilot",
                },
            },
            display = {
                action_palette = {
                    provider = "snacks",
                    opts = {
                        show_default_actions = true,
                        show_default_prompt_library = true,
                    },
                },
            },
        },
    },
}
