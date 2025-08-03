return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvimtools/none-ls-extras.nvim",
	},
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.black.with({
					extra_args = { "--fast" },
				}),
				null_ls.builtins.formatting.prettierd,
				null_ls.builtins.formatting.biome,
				null_ls.builtins.formatting.shfmt,
				require("none-ls.diagnostics.eslint_d"),
			},
		})
	end,
}
