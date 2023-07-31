local M = {}

local api = vim.api

function M.get_namespace(path)
	local namespace = ""

	-- get path of current file removing the file name
	local current_dir = vim.fn.fnamemodify(path, ":h")

	-- loop until find a csproj file or reach the root directory
	while current_dir ~= "/" do
		-- check if a csproj file exists in the current directory
		local csproj_found = vim.fn.glob(current_dir .. "/*.csproj") ~= ""

		if csproj_found then
			-- get the current directory name and append to the namespace
			namespace = current_dir:match("[^/]+$") .. (namespace ~= "" and "." .. namespace or "")
			break
		end

		-- if no csproj file was found, get the current directory name and append to the namespace
		namespace = current_dir:match("[^/]+$") .. (namespace ~= "" and "." .. namespace or "")

		-- get the parent directory
		current_dir = vim.fn.fnamemodify(current_dir, ":h")
	end

	return "namespace " .. namespace .. ";"
end

function M.insert_namespace()
	-- get buffer number
	local bufnr = api.nvim_get_current_buf()

	-- get buffer path
	local path = api.nvim_buf_get_name(bufnr)

	local namespace = M.get_namespace(path)

	-- get cursor line
	local line = api.nvim_win_get_cursor(0)[1]

	-- insert namespace on the line above and one empty line
	api.nvim_buf_set_lines(bufnr, line - 1, line - 1, false, { namespace, "" })

	-- go to insert mode
	api.nvim_command("startinsert")
end

return M
