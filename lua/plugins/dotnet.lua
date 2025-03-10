return {
    {
        "GustavEikaas/easy-dotnet.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            'nvim-telescope/telescope.nvim',
        },
        opts = {},
        keys = function()
            local dotnet = require("easy-dotnet")
            return {
                { "<leader>rb", function() dotnet.build() end, desc = "build" },
                { "<leader>rc", function() dotnet.clean() end, desc = "clean" },
            }
        end,
    },
    -- {
    --     "EthanJWright/vs-tasks.nvim",
    --     dependencies = {
    --         "nvim-lua/popup.nvim",
    --         "nvim-lua/plenary.nvim",
    --         "nvim-telescope/telescope.nvim",
    --     },
    --     keys = {
    --         {
    --             "<leader>rt",
    --             function()
    --                 require("telescope").extensions.vstask.tasks()
    --             end,
    --             desc = "tasks",
    --         }
    --     },
    -- }
}
