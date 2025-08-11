return {
  "FabijanZulj/blame.nvim",
  lazy = false,
  config = function()
    ---@diagnostic disable-next-line: missing-fields
    require("blame").setup({})
    vim.keymap.set("n", "<leader>gb", "<cmd>BlameToggle<CR>", { desc = "Toggle Git Blame" })
  end,
}
