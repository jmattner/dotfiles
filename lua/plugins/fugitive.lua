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
        { "<leader>gs", vim.cmd.Git, desc = "Git Status" },
    },
    opts = {},
}
