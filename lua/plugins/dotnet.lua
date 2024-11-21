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
                    easy.clean()
                end,
                desc = "build solution"
            },
            {
                "<leader>rx",
                function()
                    easy.clean()
                end,
                desc = "clean"
            },
        }
    end
}
