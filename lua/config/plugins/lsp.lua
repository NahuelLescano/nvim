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

  config = function()
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


    local capabilities = require('blink.cmp').get_lsp_capabilities()
    local lspconfig = require('lspconfig')
    lspconfig['lua_ls'].setup({
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" }
          },
        }
      }
    })

    lspconfig['ts_ls'].setup({ capabilities = capabilities })
    lspconfig['html'].setup({ capabilities = capabilities })
    lspconfig['cssls'].setup({ capabilities = capabilities })
    lspconfig['jsonls'].setup({ capabilities = capabilities })
    lspconfig['tailwindcss'].setup({
      capabilities = capabilities,
      filetypes = { "html", "javascript", "typescript", "astro", "vue", "svelte" }
    })
    lspconfig['astro'].setup({
      capabilities = capabilities,
      settings = {
        astro = {
          filetypes = { "astro", "html" },
          enable = true,
        }
      }
    })
    lspconfig['bashls'].setup({ capabilities = capabilities })
    lspconfig['basedpyright'].setup({ capabilities = capabilities })

    vim.keymap.set("n", "<space>ft", function() vim.lsp.buf.format() end, { desc = "Format buffer with LSP" })
  end

}
