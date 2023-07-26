local M = {}

M.setup = function()
	return {
		{
			"VonHeikemen/lsp-zero.nvim",
			branch = "dev-v3",
			dependencies = {
				{
					"neovim/nvim-lspconfig",
					dependencies = { "hrsh7th/cmp-nvim-lsp" },
				},
				{
					"williamboman/mason.nvim",
					build = function()
						pcall(vim.api.nvim_command, "MasonUpdate")
					end,
				},
				{ "williamboman/mason-lspconfig.nvim" },
				{ "saadparwaiz1/cmp_luasnip" },
				{ "hrsh7th/cmp-path" },
				{ "hrsh7th/cmp-cmdline" },
				{
					"hrsh7th/nvim-cmp",
					dependencies = {
						{
							"L3MON4D3/LuaSnip",
							dependencies = { "rafamadriz/friendly-snippets" },
						},
					},
				},
				{
					"jose-elias-alvarez/null-ls.nvim",
					dependencies = { "nvim-lua/plenary.nvim" },
				},
			},
			config = function()
				local lsp = require("lsp-zero").preset({})

				lsp.on_attach(function(_, bufnr)
					lsp.default_keymaps({ buffer = bufnr })
				end)

				lsp.format_on_save({
					format_opts = {
						async = false,
						timeout_ms = 10000,
					},
					servers = {
						["null-ls"] = {
							"javascript",
							"typescript",
							"lua",
						},
					},
				})

				require("mason").setup({})

				require("mason-lspconfig").setup({
					ensure_installed = { "tsserver", "lua_ls" },

					handlers = {
						lsp.default_setup,

						lua_ls = function()
							require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())
						end,
					},
				})

				require("plugins.lsp.null-ls").setup()
				require("plugins.lsp.cmp").setup()
			end,
		},
	}
end

return M
