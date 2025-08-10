-- vim.loader.enable()

vim.g.mapleader = vim.keycode("<space>")
vim.g.maplocalleader = vim.keycode("<space>")

require("config")
require("jmattner")

vim.fn.setup_lsp()
