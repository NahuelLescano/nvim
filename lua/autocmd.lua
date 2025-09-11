vim.api.nvim_create_autocmd("BufWritePost", {
	callback = function()
		local ns = vim.api.nvim_create_namespace("save_highlight")

		local line_nr = vim.api.nvim_win_get_cursor(0)[1] - 1
		local line_text = vim.api.nvim_buf_get_lines(0, line_nr, line_nr + 1, false)[1]

		if not line_text or line_text == "" then
			return
		end

		local start_col = line_text:find("%S") - 1
		local end_col = #line_text

		local id = vim.api.nvim_buf_set_extmark(0, ns, line_nr, start_col, {
			end_col = end_col,
			hl_group = "Visual",
		})

		vim.defer_fn(function()
			vim.api.nvim_buf_del_extmark(0, ns, id)
		end, 300)
	end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yaking (copying) text",
	group = vim.api.nvim_create_augroup("Yanking-highlight", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

