return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")

		harpoon:setup()

		vim.keymap.set("n", "<leader>a", function()
			harpoon:list():add()
		end, { desc = "Add current file to Harpoon" })
		vim.keymap.set("n", "<C-e>", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, { desc = "Toggle Harpoon quick menu" })

		vim.keymap.set("n", "<leader>h", function()
			harpoon:list():select(1)
		end, { desc = "Select first Harpoon item" })
		vim.keymap.set("n", "<Meader>j", function()
			harpoon:list():select(2)
		end, { desc = "Select second Harpoon item" })
		vim.keymap.set("n", "<Meader>k", function()
			harpoon:list():select(3)
		end, { desc = "Select third Harpoon item" })
		vim.keymap.set("n", "<Meader>l", function()
			harpoon:list():select(4)
		end, { desc = "Select fourth Harpoon item" })

		-- Toggle previous & next buffers stored within Harpoon list
		vim.keymap.set("n", "<C-S-P>", function()
			harpoon:list():prev()
		end, { desc = "Previous Harpoon item" })
		vim.keymap.set("n", "<C-S-N>", function()
			harpoon:list():next()
		end, { desc = "Next Harpoon item" })
	end,
}
