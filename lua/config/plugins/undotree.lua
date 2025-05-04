return {
  "jiaoshijie/undotree",
  dependencies = "nvim-lua/plenary.nvim",
  config = true,
  keys = { -- load the plugin only when using it's keybinding:
    { "<leader>uo", "<cmd>lua require('undotree').toggle()<cr>" },
    { "<leader>uc", "<cmd>lua require('undotree').close()<cr>" },
  },
}
