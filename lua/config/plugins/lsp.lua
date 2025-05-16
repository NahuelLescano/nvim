return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "folke/lazydev.nvim",
    "folke/neodev.nvim",
    ft = "lua",
    opts = {
      library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
  opts = {
    servers = {
      lua_ls = {
        settings = {
          Lua = {
            completion = {
              callSnippet = "Replace"
            }
          }
        }
      },
      ts_ls = {},
      html = {},
      cssls = {},
      jsonls = {},
      tailwindcss = {},
      astro = {},
      bashls = {},
      pylyzer = {},
      clangd = {},
    }
  },
  config = function(_, opts)
    require("neodev").setup()

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
