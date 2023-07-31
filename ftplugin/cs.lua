local opts = { mode = "n", prefix = "<leader>", buffer = nil, silent = true, noremap = true, nowait = true }

local mappings = {
	n = {
		name = "Namespace",
		s = { "<cmd>lua require('functions.csharp-namespace').insert_namespace()<cr>", "Insert" },
	},
}

require("which-key").register(mappings, opts)
