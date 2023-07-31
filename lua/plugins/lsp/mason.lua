local M = {}

M.setup = function()
	local lsp = require("lsp-zero")

	local servers = {
		"tsserver",
		"lua_ls",
		"csharp_ls",
		"dockerls",
		"docker_compose_language_service",
	}

	require("mason").setup({})

	require("mason-lspconfig").setup({
		ensure_installed = servers,

		handlers = {
			lsp.default_setup,

			lua_ls = function()
				require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())
			end,
		},
	})

	local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
	if not lspconfig_status_ok then
		return
	end

	local opts = {}

	for _, server in pairs(servers) do
		opts = {
			on_attach = require("plugins.lsp.handlers").on_attach,
			capabilities = require("plugins.lsp.handlers").capabilities,
		}

		server = vim.split(server, "@")[1]

		local require_ok, conf_opts = pcall(require, "plugins.lsp.settings." .. server)
		if require_ok then
			opts = vim.tbl_deep_extend("force", conf_opts, opts)
		end

		lspconfig[server].setup(opts)
	end
end

return M
