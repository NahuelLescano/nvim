local M = {}

-- Function to toggle Telescope with Harpoon files
-- @param harpoon_files Table containing Harpoon file items
local function toggle_telescope(harpoon_files)
  local conf = require("telescope.config").values
	local file_paths = {}
	for _, item in ipairs(harpoon_files.items) do
		table.insert(file_paths, item.value)
	end

	require("telescope.pickers")
		.new({}, {
			prompt_title = "Harpoon",
			finder = require("telescope.finders").new_table({
				results = file_paths,
				entry_maker = function(entry)
					local filename = vim.fn.fnamemodify(entry, ":t")
					local icon, icon_hl = require("nvim-web-devicons").get_icon(filename, vim.fn.fnamemodify(entry, ":e"))
					return {
						value = entry,
						display = function(entry_table)
							local display_text = (icon or "") .. " " .. entry_table.value
							return display_text, { { { 0, #(icon or "") }, icon_hl } }
						end,
						ordinal = entry,
					}
				end,
			}),
			previewer = conf.file_previewer({}),
			sorter = conf.generic_sorter({}),
		})
		:find()
end

M.toggle_telescope = toggle_telescope

return M
