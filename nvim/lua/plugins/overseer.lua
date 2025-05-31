return {
    {
        'stevearc/overseer.nvim',
        opts = {
            templates = { "builtin", "local.dotnet", "local.launch_godot" },
            { "nvim-lua/plenary.nvim" },
        },
        keys = {
            { "<leader>mo", "<cmd>OverseerToggle!<cr>", desc = "Overseer tasks" },
            {
                "<leader>mp",
                function()
                    require("overseer").debug_parser()
                end,
                desc = "Overseer parser tester"
            },
        }
    },
}
