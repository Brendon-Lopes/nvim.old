local opts = { mode = "n", prefix = "<leader>", buffer = nil, silent = true, noremap = true, nowait = true }

local mappings = {
	l = {
		name = "Typescript",
		i = { "<cmd>TypescriptAddMissingImports<Cr>", "AddMissingImports" },
		o = { "<cmd>TypescriptOrganizeImports<cr>", "OrganizeImports" },
		u = { "<cmd>TypescriptRemoveUnused<Cr>", "RemoveUnused" },
		r = { "<cmd>TypescriptRenameFile<Cr>", "RenameFile" },
		f = { "<cmd>TypescriptFixAll<Cr>", "FixAll" },
		g = { "<cmd>TypescriptGoToSourceDefinition<Cr>", "GoToSourceDefinition" },
	},
}

require("which-key").register(mappings, opts)
