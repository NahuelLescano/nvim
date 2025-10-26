return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")
    local toggle_telescope = require("config.harpoon.toggle").toggle_telescope

		harpoon:setup()

		vim.keymap.set("n", "<leader>a", function()
			harpoon:list():add()
		end, { desc = "Add current file to Harpoon" })

    vim.keymap.set("n", "<C-e>", function ()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = "Toggle Harpoon quick menu" })

		for i = 1, 5 do
			vim.keymap.set("n", "<leader>" .. i, function()
				require("harpoon"):list():select(i)
			end, { desc = "Harpoon to file" .. i })
		end

		vim.keymap.set("n", "<leader>fe", function()
			toggle_telescope(harpoon:list())
		end, { desc = "Open harpoon window" })
	end,
}
