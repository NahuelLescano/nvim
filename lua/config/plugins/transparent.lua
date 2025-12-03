return {
	"xiyaowong/transparent.nvim",
	config = function()
		require("transparent").setup({
			groups = {
				"Normal",
				"NormalNC",
				"Comment",
				"Constant",
				"Special",
				"Identifier",
				"Statement",
				"PreProc",
				"Type",
				"Underlined",
				"Todo",
				"String",
				"Function",
				"Conditional",
				"Repeat",
				"Operator",
				"Structure",
				"LineNr",
				"NonText",
				"SignColumn",
				"CursorLineNr",
				"StatusLineNC",
				"EndOfBuffer",
			},
			exclude_groups = {
				"NotifyBackground",
				"NotifyINFO",
				"NotifyERROR",
				"NotifyWARN",
				"NotifyDEBUG",
				"NotifyTRACE",
			},
		})
		vim.keymap.set("n", "<leader>tt", "<cmd>TransparentToggle<CR>", {
			desc = "Toggle Transparent Background",
		})
	end,
}
