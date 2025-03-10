return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim", {
      "folke/lazydev.nvim",
      ft = "lua",
      opts = {
        library = {
          { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        },
      },
    },
    },
    opts = {
      servers = {
        lua_ls = {},
        ts_ls = {},
        html = {},
        cssls = {},
        rust_analyzer = {},
        jsonls = {},
        tailwindcss = {},
        astro = {}
      }
    },
    config = function(_, opts)
      require("mason").setup({
        ensure_installed = {
          "lua_ls",
          "ts_ls",
          "html",
          "cssls",
        },
      })

      local lspconfig = require('lspconfig')
      for server, config in pairs(opts.servers) do
        config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
        lspconfig[server].setup(config)
      end

      vim.keymap.set("n", "<space>ft", function() vim.lsp.buf.format() end)
    end
  }
}
