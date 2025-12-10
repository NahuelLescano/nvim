return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},

	config = function()
		require("render-markdown").setup({
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
				"vtsls",
				"html",
				"cssls",
				"eslint_d",
				"jsonls",
			},
		})

		vim.diagnostic.config({
			virtual_text = true,
		})

		local capabilities = require("blink.cmp").get_lsp_capabilities()

		vim.lsp.config("*", {
			capabilities = capabilities,
		})

		vim.lsp.config.lua_ls = {
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
				},
			},
		}

		vim.lsp.config.vtsls = {}
		vim.lsp.config.html = {}
		vim.lsp.config.cssls = {}
		vim.lsp.config.jsonls = {}
		vim.lsp.config.tailwindcss = {
			filetypes = { "html", "javascript", "typescript", "astro", "vue" },
		}
		vim.lsp.config.astro = {
			settings = {
				astro = {
					filetypes = { "astro", "html" },
					enable = true,
				},
			},
		}
		vim.lsp.config.bashls = {}
		vim.lsp.config.basedpyright = {}
		vim.lsp.config.clangd = {}
		vim.lsp.config.gopls = {}

		vim.lsp.enable({
			"lua_ls",
			"vtsls",
			"html",
			"cssls",
			"jsonls",
			"tailwindcss",
			"astro",
			"bashls",
			"basedpyright",
			"clangd",
			"gopls",
		})

		vim.keymap.set("n", "<space>ft", function()
			vim.lsp.buf.format()
		end, { desc = "Format buffer with LSP" })
	end,
}
