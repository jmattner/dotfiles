return {
    "NStefan002/screenkey.nvim",
    lazy = false,
    version = "*",
    keys = {
        {
            "<leader>mk",
            function()
                vim.cmd("Screenkey toggle")
            end,
            desc = "Screenkey",
        },
    },
    opts = {
        compress_after = 3,
        clear_after = 2,
        show_leader = false,
    },
}
