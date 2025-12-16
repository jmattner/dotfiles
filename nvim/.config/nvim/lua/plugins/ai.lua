return {
    {
        "zbirenbaum/copilot.lua",
        -- dependencies = {
        --     "copilotlsp-nvim/copilot-lsp", -- for NES functionality
        --     init = function()
        --         vim.g.copilot_nes_debounce = 500
        --         vim.lsp.enable("copilot_ls")
        --     end,
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
                --     accept_and_goto = false,
                --     accept = "<C-Tab>",
                --
                --     dismiss = "<Esc>",
                -- },
            },
        },
    },
    {
        "folke/sidekick.nvim",
        -- deps, snacks and nvimt-treesitter-textobjexts
        keys = {
            {
                "<C-tab>",
                function()
                    if require("sidekick").nes_jump_or_apply() then
                        return
                    end

                    if vim.lsp.inline_completion.get() then
                        return
                    end

                    return "<C-tab>" -- fallback
                end,
                expr = true,
                desc = "Goto/Apply Next Edit Suggestion",
            },
        },
        opts = {
            cli = {
                nes = {
                    enabled = true,
                },
                mux = {
                    enabled = true,
                    backend = "tmux",
                    create = "window",
                },
            },
        },
    },
    -- {
    --     "olimorris/codecompanion.nvim",
    --     dependencies = {
    --         "nvim-lua/plenary.nvim",
    --         "nvim-treesitter/nvim-treesitter",
    --         "ravitemer/mcphub.nvim",
    --     },
    --     keys = {
    --         { "<leader>aa", "<cmd>CodeCompanionActions<cr>", desc = "CodeCompanion Actions" },
    --         { "<leader>ac", "<cmd>CodeCompanionChat Toggle<cr>", desc = "CodeCompanion Chat" },
    --     },
    --     opts = {
    --         extensions = {
    --             mcphub = {
    --                 callback = "mcphub.extensions.codecompanion",
    --                 opts = {
    --                     make_vars = true,
    --                     make_slash_commands = true,
    --                     show_result_in_chat = true,
    --                 },
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
    -- {
    --     "ravitemer/mcphub.nvim",
    --     dependencies = {
    --         "nvim-lua/plenary.nvim",
    --     },
    --     build = "npm install -g mcp-hub@latest", -- Installs `mcp-hub` node binary globally
    --     opts = {},
    -- },
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
    -- {
    --     "CopilotC-Nvim/CopilotChat.nvim",
    --     enabled = false,
    --     dependencies = {
    --         { "zbirenbaum/copilot.lua" },
    --         {
    --             "nvim-lua/plenary.nvim",
    --             branch = "master",
    --         },
    --     },
    --     keys = {
    --         { "<leader>mc", vim.cmd.CopilotChatToggle, desc = "CopilotChat" },
    --     },
    --     opts = {
    --         model = "gpt-4o",
    --         agent = "copilot",
    --         selection = function(source)
    --             return require("CopilotChat.select").visual(source)
    --         end,
    --         question_header = "# me ",
    --     },
    --     -- See Commands section for default commands if you want to lazy load on them
    -- },
}
