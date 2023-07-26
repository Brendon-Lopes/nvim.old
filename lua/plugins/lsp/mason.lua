local M = {}

M.setup = function()
	local lsp = require("lsp-zero")

	require("mason").setup({})

	require("mason-lspconfig").setup({
		ensure_installed = {
			"tsserver",
			"lua_ls",
			"omnisharp",
			"dockerls",
			"docker_compose_language_service",
		},
		handlers = {
			lsp.default_setup,

			lua_ls = function()
				require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())
			end,
		},
	})
end

return M
