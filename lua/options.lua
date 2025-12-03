vim.g.maplocalleader = " "
vim.g.mapleader = " "
vim.g.netrw_banner = 0

local opts = vim.opt

opts.number = true
opts.relativenumber = true
opts.mouse = "a"

opts.tabstop = 2
opts.softtabstop = 2
opts.shiftwidth = 2

opts.expandtab = true
opts.smartindent = true

opts.clipboard = "unnamedplus"
opts.signcolumn = "yes:1"

opts.swapfile = false
opts.backup = false

opts.hlsearch = true
opts.incsearch = true
opts.scrolloff = 8
opts.signcolumn = "yes"
opts.isfname:append("@-@")
opts.cursorline = true
opts.linebreak = true

opts.ignorecase = true
opts.smartcase = true
opts.inccommand = "split"

opts.undofile = true

opts.termguicolors = true
