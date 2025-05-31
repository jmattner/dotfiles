-- grouped as per :options

local o = vim.opt

-- 1 important

-- 2 moving around, searching and patterns
o.incsearch = true
o.ignorecase = true
o.smartcase = true

-- 3 tags

-- 4 displaying text
o.scrolloff = 8
o.wrap = false
o.list = true
o.listchars = { space = '⋅', trail = '⋅', tab = '  ' }
o.nu = true
o.relativenumber = true

-- 5 syntax, highlighting and spelling
o.hlsearch = false
o.termguicolors = true
o.colorcolumn = "80"

-- 6 multiple windows
o.laststatus = 3
o.splitbelow = true
o.splitright = true

-- 7 multiple tab pages

-- 8 terminal

-- 9 using the mouse

-- 10 messages and info

-- 11 selecting text

-- 12 editing text
o.undofile = true
o.undodir = os.getenv("HOME") .. "/.vim/undodir"

-- 13 tabs and indenting
o.tabstop = 4
o.shiftwidth = 4
o.softtabstop = 4
o.expandtab = true
o.smartindent = true

-- 14 folding

-- 15 diff mode

-- 16 mapping

-- 17 reading and writing files
o.backup = false

-- 18 the swap file
o.swapfile = false
o.updatetime = 50

-- 19 command line editing

-- 20 executing external commands
o.shell = "pwsh.exe"
o.shellquote = ""
o.shellxquote = ""
o.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
-- o.shellredir = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
o.shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait"

-- 21 running make and jumping to errors (quickfix)
o.shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"

-- 22 system specific

-- 23 language specific
o.isfname:append("@-@")

-- 24 multi-byte characters

-- 25 various
o.signcolumn = "yes"

-- TODO - better place to put these
local g = vim.g
g.loaded_python3_provider = 0
g.loaded_ruby_provider = 0
g.loaded_perl_provider = 0
