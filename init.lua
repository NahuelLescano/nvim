require("options")
require("keymaps")
require("config.lazy")

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yaking (copying) text",
  group = vim.api.nvim_create_augroup("Yanking-highlight", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

