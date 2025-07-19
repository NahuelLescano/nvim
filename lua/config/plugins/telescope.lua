return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-ui-select.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
  },
  config = function()
    local telescope = require("telescope")
    telescope.setup({
      pickers = {
        find_files = {
          theme = "ivy",
        },
        buffers = {
          theme = "ivy",
        },
        grep_string = {
          theme = "ivy",
        },
        help_tags = {
          theme = "ivy",
        },
        keymaps = {
          theme = "ivy",
        },
        git_files = {
          theme = "ivy",
        },
        live_grep = {
          theme = "ivy",
        },
      },
      extensions = {
        fzf = {},
      }
    })
    telescope.load_extension("fzf")
    telescope.load_extension("noice")
    telescope.load_extension("ui-select")

    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
    vim.keymap.set('n', '<leader>fn', function()
      builtin.find_files({
        cwd = vim.fn.stdpath("config")
      })
    end, { desc = 'Telescope find nvim files' })
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
    vim.keymap.set('n', '<leader>fs', builtin.grep_string, { desc = 'Telescope grep string' })
    vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
    vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
    vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = 'Search git files' })

    require("config.telescope.multigrep").setup()

    vim.keymap.set('n', '<leader>nn', function()
      require('telescope').extensions.notify.notify({
        theme = "ivy",
        layout_config = {
          width = 0.8,
          height = 0.8,
        },
      })
    end, { desc = 'Telescope notify' })
  end
}
