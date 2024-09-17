vim.api.nvim_create_autocmd({ "User" }, {
    pattern = "FugitiveIndex",
    callback = function()
        vim.keymap.set("n", "<leader>gk", "<cmd>Git push<cr>", { buffer = true })
        vim.keymap.set("n", "<leader>gj", "<cmd>Git pull<cr>", { buffer = true })
    end,
})

return {
    "tpope/vim-fugitive",
    keys = {
        { "<leader>gs", vim.cmd.Git,                        desc = "git status" },
        { "<leader>gl", "<cmd>Git log --oneline<cr><C-w>H", desc = "git log" },
        {
            "<leader>gh",
            function()
                local path = vim.fn.expand("%")
                vim.cmd("Git log --oneline " .. path)
            end,
            desc = "git history",
        },
    },
    config = function()
        -- loading via opts = {} produces error for some reason
    end,
}
