---@module "snacks"

return {
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        ---@type snacks.Config
        opts = {
            picker = {
                enabled = true,
                sources = {
                    files = {
                        hidden = true,
                    },
                },
                hidden = true,
            }
        },
        keys = {
            { "<leader>p:", function() Snacks.picker.command_history() end, desc = "Command History" },
            { "<leader>pn", function() Snacks.picker.notifications() end,   desc = "Notification History" },
            { "<leader>pb", function() Snacks.picker.buffers() end,         desc = "Buffers" },
            { "<leader>pf", function() Snacks.picker.files() end,           desc = "Files" },
            { "<leader>pp", function() Snacks.picker.projects() end,        desc = "Projects" },
            { "<leader>ps", function() Snacks.picker.grep() end,            desc = "Grep" },
            { "<leader>pw", function() Snacks.picker.grep_word() end,       desc = "Visual selection or word", mode = { "n", "x" } },
            { "<leader>ph", function() Snacks.picker.help() end,            desc = "Help Pages" },
            { "<leader>pH", function() Snacks.picker.highlights() end,      desc = "Highlights" },
            -- git
            { "<leader>gb", function() Snacks.picker.git_branches() end,    desc = "Git Branches" },
            { "<leader>gl", function() Snacks.picker.git_log() end,         desc = "Git Log" },
            { "<leader>gL", function() Snacks.picker.git_log_line() end,    desc = "Git Log Line" },
            -- { "<leader>gs", function() Snacks.picker.git_status() end,      desc = "Git Status" },
            { "<leader>gS", function() Snacks.picker.git_stash() end,       desc = "Git Stash" },
            { "<leader>gd", function() Snacks.picker.git_diff() end,        desc = "Git Diff (Hunks)" },
            { "<leader>gf", function() Snacks.picker.git_log_file() end,    desc = "Git Log File" },
        },
    },
    -- lazy.nvim
    {
        "folke/snacks.nvim",
        ---@type snacks.Config
        opts = {}
    }
}
