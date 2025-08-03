return {
	"NStefan002/screenkey.nvim",
	lazy = false,
	version = "*",
	config = function()
		require("screenkey").setup({
			position = "top-right",
			font_size = 16,
			font_family = "IosevkaTerm Nerd Font",
			disable = {
				buftypes = { "Terminal" },
			},
		})

		vim.keymap.set("n", "<leader>ss", function()
			require("screenkey").toggle()
		end, { desc = "Toggle Screenkey" })
	end,
}
