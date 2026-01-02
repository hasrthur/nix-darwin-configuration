vim.g.mapleader = " "

local o = vim.opt

o.winborder = "solid"
o.clipboard = "unnamedplus"
o.cursorline = true
o.ignorecase = true
o.smartcase = true
o.mouse = "a"

o.number = true
o.relativenumber = true
o.signcolumn = "yes"

o.smartindent = true

o.splitbelow = true
o.splitright = true

o.swapfile = false
o.writebackup = false

o.termguicolors = true

o.undofile = true

o.list = true
o.listchars = { tab = "⇥⇥", eol = "↲", space = "·" }
