return {
    {
        "zbirenbaum/copilot.lua",
        opts = {
            suggestion = {
                enabled = false,
                -- enabled = true,
                -- hide_during_completion = false,
                -- auto_trigger = true,
            },
            panel = {
                enabled = false,
            },
        }
    },
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        dependencies = {
            { "zbirenbaum/copilot.lua", },
            {
                "nvim-lua/plenary.nvim",
                branch = "master"
            },
        },
        keys = {
            { "<leader>mc", vim.cmd.CopilotChatToggle, desc = "CopilotChat" }
        },
        opts = {
            model = 'gpt-4o',
            agent = 'copilot',
            selection = function(source)
                return require("CopilotChat.select").visual(source)
            end,
            question_header = '# me ',
        },
        -- See Commands section for default commands if you want to lazy load on them
    },
}
