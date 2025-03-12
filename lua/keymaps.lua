vim.keymap.set("n", "<leader><leader>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<leader>x", "<cmd>:lua .<CR>")
vim.keymap.set("v", "<leader>x", "<cmd>:lua .<CR>")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "<M-j>", "<cmd>cnext<CR>")
vim.keymap.set("n", "<M-k>", "<cmd>cprev<CR>")
vim.keymap.set("n", "<M-q>", "<cmd>cclose<CR>")

vim.keymap.set("n", "<space>st", function ()
    vim.cmd.vnew()
    vim.cmd.term()
    vim.cmd.wincmd("J")
    vim.api.nvim_win_set_height(0, 15)
end)

vim.keymap.set("t", "<esc><esc>", "<C-\\><C-n>")

vim.keymap.set("n", "<leader>nd", "<cmd>NoiceDismiss<CR>")
