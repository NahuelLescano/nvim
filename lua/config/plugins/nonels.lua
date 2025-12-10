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
				null_ls.builtins.formatting.biome,
				null_ls.builtins.formatting.eslint.with({
					command = "bunx",
					args = { "eslint", "--fix", "--stdin", "--stdin-filename", "$FILENAME", "--config", "eslint.config.js" },
				}),
				null_ls.builtins.diagnostics.eslint.with({
					command = "bunx",
					args = {
						"eslint",
						"--format",
						"unix",
						"--stdin",
						"--stdin-filename",
						"$FILENAME",
						"--config",
						"eslint.config.js",
					},
				}),
				null_ls.builtins.formatting.shfmt,
			},
		})
	end,
}
