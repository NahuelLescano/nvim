vim.keymap.set("n", "<leader><leader>x", "<cmd>source %<CR>", { desc = "Source current file" })
vim.keymap.set("n", "<leader>x", "<cmd>:lua .<CR>", { desc = "Run current file" })
vim.keymap.set("v", "<leader>x", "<cmd>:lua .<CR>", { desc = "Run selected code" })

vim.keymap.set("v", "J", ":m '>'+1<CR>gv=gv", { desc = "Move selected lines down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected lines up" })
vim.keymap.set("n", "<M-j>", ":m .+1<CR>>==", { desc = "Move current line down" })
vim.keymap.set("n", "<M-k>", ":m .-2<CR>>==", { desc = "Move current line up" })

vim.keymap.set("n", "<M-J>", "<cmd>cnext<CR>", { desc = "Next quickfix item" })
vim.keymap.set("n", "<M-K>", "<cmd>cprev<CR>", { desc = "Previous quickfix item" })
vim.keymap.set("n", "<M-q>", "<cmd>cclose<CR>", { desc = "Close quickfix window" })

vim.keymap.set("n", "<leader>bd", "<cmd>%bd|e#<CR>", { desc = "Close all buffers except current" })

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })

vim.keymap.set("t", "<esc><esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

vim.keymap.set("n", "<leader>bn", "<cmd>bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>bp", "<cmd>bprevious<CR>", { desc = "Previous buffer" })

vim.keymap.set("n", "<leader>tt", "<cmd>TransparentToggle<CR>", {
  desc = "Toggle Transparent Background",
})

vim.keymap.set("n", "<leader>tce", function()
  vim.cmd("Copilot toggle")
  print("Toggled Copilot")
end, { desc = "Toggle Copilot" })

vim.keymap.set("n", "<leader>tcd", function()
  vim.cmd("Copilot disable")
  print("Disable Copilot")
end, { desc = "Disable Copilot" })

vim.keymap.set("n", "<leader>td", function()
  vim.cmd("Copilot disable")
  vim.cmd("lsp stop")
  print("Copilot and lsp disable")
end, { desc = "Toggle disable LSP and Copilot" })

vim.keymap.set("n", "<leader>te", function()
  vim.cmd("Copilot enable")
  vim.cmd("LspStart")
  print("Copilot and lsp enable")
end, { desc = "Toggle enable LSP and Copilot" })

vim.keymap.set("n", "<space>st", function()
  vim.cmd.vnew()
  vim.cmd.term()
  vim.cmd.wincmd("J")
  vim.api.nvim_win_set_height(0, 10)
end, { desc = "Open terminal in split" })
