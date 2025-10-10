vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- move visual selection up/down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- disabled because of neoscroll
-- center view on cursor when jumping around
-- vim.keymap.set("n", "<C-d>", "<C-d>zz")
-- vim.keymap.set("n", "<C-u>", "<C-u>zz")
-- vim.keymap.set("n", "n", "nzzzv")
-- vim.keymap.set("n", "N", "Nzzzv")

-- vim.keymap.set("n", "<leader>y", "\"*y")
-- vim.keymap.set("v", "<leader>y", "\"*y")
-- vim.keymap.set("n", "<leader>Y", "\"*Y")

-- vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
-- vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
-- vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Find and Replace" })

vim.keymap.set("n", "<C-w>#", [[:%bd|e#<CR>]], { desc = "Close Other Buffers" })

-- unbind
vim.keymap.set("n", "Q", "<nop>")
