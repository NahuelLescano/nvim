return {
  'brianhuster/live-preview.nvim',
  dependencies = {
    'nvim-telescope/telescope.nvim',
  },
  config = function()
    require('livepreview.config').set({
      port = 5500,
      browser = 'default',
      dynamic_root = false,
      sync_scroll = true,
      picker = "",
    })

    vim.keymap.set("n", "<leader>pp", ":LivePreview start<CR>")
    vim.keymap.set("n", "<leader>pc", ":LivePreview close<CR>")
  end
}
