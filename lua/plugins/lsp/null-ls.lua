local M = {}

M.setup = function()
	local null_ls = require("null-ls")

	local formatting = null_ls.builtins.formatting
	local diagnostics = null_ls.builtins.diagnostics

	null_ls.setup({
		sources = {
			formatting.stylua,
			formatting.prettier,
			diagnostics.eslint,
		},
	})
end

return M
