local M = {}

M.setup = function()
	local signs = {

		{ name = "DiagnosticSignError", text = "" },
		{ name = "DiagnosticSignWarn", text = "" },
		{ name = "DiagnosticSignHint", text = "" },
		{ name = "DiagnosticSignInfo", text = "" },
	}

	for _, sign in ipairs(signs) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
	end

	local config = {
		virtual_text = true,
		signs = {
			active = signs,
		},
		update_in_insert = true,
		underline = true,
		severity_sort = true,
		float = {
			focusable = true,
			style = "minimal",
			border = "rounded",
			source = "always",
			header = "",
			prefix = "",
		},
	}

	vim.diagnostic.config(config)
end

local function lsp_keymaps(bufnr)
	local function keymap(mode, key, command, desc)
		vim.api.nvim_buf_set_keymap(bufnr, mode, key, command, { noremap = true, silent = true, desc = desc })
	end

	-- register keymaps on which_key
	keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", "Go to declaration")
	keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", "Go to definition")
	keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", "Hover")
	keymap("n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", "Go to implementation")
	keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", "Go to references")
	keymap("n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", "Open diagnostics float")
	keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", "Format buffer")
	keymap("n", "<leader>li", "<cmd>LspInfo<cr>", "LSP info")
	keymap("n", "<leader>lI", "<cmd>LspInstallInfo<cr>", "LSP install info")
	keymap("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code action")
	keymap("n", "<leader>lj", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>", "Next diagnostic")
	keymap("n", "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", "Previous diagnostic")
	keymap("n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename")
	keymap("n", "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature help")
	keymap("n", "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>", "Add diagnostics to location list")
end

M.on_attach = function(client, bufnr)
	if client.name == "tsserver" then
		client.server_capabilities.documentFormattingProvider = false
	end

	if client.name == "lua_ls" then
		client.server_capabilities.documentFormattingProvider = false
	end

	lsp_keymaps(bufnr)
	local status_ok, illuminate = pcall(require, "illuminate")
	if not status_ok then
		return
	end
	illuminate.on_attach(client)
end

return M
