vim.g.maplocalleader = " "
vim.g.mapleader = " "

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
opts.undodir = vim.fn.stdpath("data") .. "/undo"
opts.undofile = true

opts.scrolloff = 8
opts.signcolumn = "yes"
opts.isfname:append("@-@")
opts.cursorline = true
opts.linebreak = true

opts.ignorecase = true
opts.smartcase = true
opts.incsearch = true

opts.inccommand = "split"

opts.termguicolors = true
opts.colorcolumn = "0"

-- require("vim._core.ui2").enable({})
