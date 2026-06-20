local set = vim.keymap.set

set("n", "<leader><leader>x", "<cmd>source %<CR>", { desc = "Source current file" })
set("n", "<leader>x", "<cmd>:lua .<CR>", { desc = "Run current file" })
set("v", "<leader>x", "<cmd>:lua .<CR>", { desc = "Run selected code" })

set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected lines up" })
set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected lines down" })
set("n", "<M-j>", ":m .+1<CR>>==", { desc = "Move current line down" })
set("n", "<M-k>", ":m .-2<CR>>==", { desc = "Move current line up" })

set("n", "<leader>j", "<cmd>cnext<CR>", { desc = "Next quickfix item" })
set("n", "<leader>k", "<cmd>cprev<CR>", { desc = "Previous quickfix item" })
set("n", "<leader>q", "<cmd>cclose<CR>", { desc = "Close quickfix window" })

set("n", "<leader>bn", "<cmd>bnext<CR>", { desc = "Next buffer" })
set("n", "<leader>bp", "<cmd>bprevious<CR>", { desc = "Previous buffer" })
set("n", "<leader>bd", "<cmd>%bd|e#<CR>", { desc = "Close all buffers except current" })

set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })

set("t", "<esc><esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

set("n", "<leader>tx", "<cmd>!chmod +x %<CR>", { silent = true }, { desc = "Make current file executable" })

set("n", "<leader>st", function()
	vim.cmd.vnew()
	vim.cmd.term()
	vim.cmd.wincmd("J")
	vim.api.nvim_win_set_height(0, 10)
end, { desc = "Open terminal in split" })

set("n", "<leader>tt", "<cmd>TransparentToggle<CR>", {
	desc = "Toggle Transparent Background",
})

set("n", "<leader>ft", function()
	vim.lsp.buf.format()
end, { desc = "Format buffer with LSP" })
