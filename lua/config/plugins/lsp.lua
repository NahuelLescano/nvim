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
      basedpyright = {},
      clangd = {},
      angularls = {
        cmd = { "ngserver", "--stdio", "--tsProbeLocations", vim.fn.getcwd(), "--ngProbeLocations", vim.fn.getcwd() },
      },
      gopls = {},
      svelte = {}
    }
  },
  config = function(_, opts)
    require("neodev").setup()

    require('render-markdown').setup({
      completions = { blink = { enabled = true } },
    })

    vim.api.nvim_create_autocmd("User", {
      pattern = "BlinkCmpMenuOpen",
      callback = function()
        vim.b.copilot_suggestion_hidden = true
      end,
    })

    vim.api.nvim_create_autocmd("User", {
      pattern = "BlinkCmpMenuClose",
      callback = function()
        vim.b.copilot_suggestion_hidden = false
      end,
    })

    require("mason").setup({
      ensure_installed = {
        "lua_ls",
        "ts_ls",
        "html",
        "cssls",
      },
    })

    vim.diagnostic.config({
      virtual_text = true
    })

    local capabilities = require('cmp_nvim_lsp').default_capabilities()


    local lspconfig = require('lspconfig')
    for server, config in pairs(opts.servers) do
      config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
      lspconfig[server].setup({ config = config, capabilities = capabilities })
    end

    vim.keymap.set("n", "<space>ft", function() vim.lsp.buf.format() end, { desc = "Format buffer with LSP" })
  end

}
