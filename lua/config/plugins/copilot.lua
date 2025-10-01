return {
	"github/copilot.vim",
	config = function()
		vim.g.copilot_no_tab_map = true
		vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
		vim.g.copilot_filetypes = {
			["*"] = true,
			["markdown"] = false,
			["json"] = false,
			["yaml"] = false,
			["toml"] = false,
			["help"] = false,
			["TelescopePrompt"] = false,
			["NvimTree"] = false,
		}
	end,
}
