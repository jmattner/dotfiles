vim.keymap.set(
    "n",
    "<leader>rh",
    "<cmd>Rest run<cr>",
    { buffer = true, noremap = true, silent = true, desc = "Run request" }
)
vim.keymap.set(
    "n",
    "<leader>rr",
    "<cmd>Rest open<cr>",
    { buffer = true, noremap = true, silent = true, desc = "Open result pane" }
)
vim.keymap.set(
    "n",
    "<leader>rl",
    "<cmd>Rest last<cr>",
    { buffer = true, noremap = true, silent = true, desc = "Run last" }
)
vim.keymap.set(
    "n",
    "<leader>re",
    "<cmd>Rest env select<cr>",
    { buffer = true, noremap = true, silent = true, desc = "Select .env" }
)
