return {
    "GustavEikaas/easy-dotnet.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        'nvim-telescope/telescope.nvim',
    },
    keys = function()
        local easy = require("easy-dotnet")
        return {
            {
                "<leader>rr",
                function()
                    easy.run_default()
                end,
                desc = "run default"
            },
            {
                "<leader>rb",
                function()
                    easy.build_solution()
                end,
                desc = "build solution"
            },
            {
                "<leader>rn",
                function()
                    easy.restore()
                end,
                desc = "restore"
            },
            {
                "<leader>rx",
                function()
                    easy.clean()
                end,
                desc = "clean"
            },
        }
    end,
    config = function(_, opts)
        require("easy-dotnet").setup(opts)
    end
}
