vim.keymap.set(
    "n",
    "<leader>rb",
    "<cmd>lua require('easy-dotnet').build()<cr>",
    { buffer = true, noremap = true, silent = true, desc = "Build" }
)
vim.keymap.set(
    "n",
    "<leader>rc",
    "<cmd>lua require('easy-dotnet').clean()<cr>",
    { buffer = true, noremap = true, silent = true, desc = "Clean" }
)
vim.keymap.set(
    "n",
    "<leader>rd",
    "<cmd>lua require('easy-dotnet.actions.diagnostics').get_workspace_diagnostics()<cr>",
    { buffer = true, noremap = true, silent = true, desc = "Diagnostics" }
)
