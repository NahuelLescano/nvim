return {
  "xiyaowong/transparent.nvim",
  config = function()
    require("transparent").setup({
      groups = {
        'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
        'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
        'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
        'SignColumn', 'CursorLine', 'CursorLineNr', 'StatusLine', 'StatusLineNC',
        'EndOfBuffer',
      },
      -- table: additional groups that should be cleared
      extra_groups = {},
      -- table: groups you don't want to clear
      exclude_groups = {
        'NotifyBackground', 'NotifyINFO', 'NotifyERROR', 'NotifyWARN',
        'NotifyDEBUG', 'NotifyTRACE',
      },
      -- function: code to be executed after highlight groups are cleared
      -- Also the user event "TransparentClear" will be triggered
      on_clear = function() end,
    })
    vim.keymap.set("n", "<leader>tt", ":TransparentToggle<CR>")
  end
}
