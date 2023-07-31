local M = {}

local api = vim.api

function M.get_namespace(path)
	local namespace = ""
	local current_dir = vim.fn.fnamemodify(path, ":h")

	while current_dir ~= "/" do
		local csproj_found = vim.fn.glob(current_dir .. "/*.csproj") ~= ""

		if csproj_found then
			namespace = current_dir:match("[^/]+$") .. (namespace ~= "" and "." .. namespace or "")
			break
		end

		namespace = current_dir:match("[^/]+$") .. (namespace ~= "" and "." .. namespace or "")

		current_dir = vim.fn.fnamemodify(current_dir, ":h")
	end

	return "namespace " .. namespace .. ";"
end

function M.insert_namespace()
	local bufnr = api.nvim_get_current_buf()

	local path = api.nvim_buf_get_name(bufnr)

	local namespace = M.get_namespace(path)

	local line = api.nvim_win_get_cursor(0)[1]

	api.nvim_buf_set_lines(bufnr, line - 1, line - 1, false, { namespace })
end

return M
