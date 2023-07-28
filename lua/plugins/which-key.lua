return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	config = function()
		local wk = require("which-key")

		wk.setup()

		local opts = { mode = "n", prefix = "<leader>", buffer = nil, silent = true, noremap = true, nowait = true }

		local mappings = {
			b = {
				name = "Buffers",
				b = { "<cmd>e #<cr>", "Switch to last buffer" },
				d = { "<cmd>bd<cr>", "Delete" },
				D = { "<cmd>bd!<cr>", "Force Delete" },
				n = { "<cmd>bn<cr>", "Next" },
				p = { "<cmd>bp<cr>", "Previous" },
				l = { "<cmd>ls<cr>", "List" },
				s = { "<cmd>bd<cr>", "Save" },
			},
			x = {
				name = "Trouble",
				x = { "<cmd>TroubleToggle<cr>", "Toggle" },
				w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "Workspace" },
				d = { "<cmd>TroubleToggle document_diagnostics<cr>", "Document" },
				q = { "<cmd>TroubleToggle quickfix<cr>", "Quickfix" },
				l = { "<cmd>TroubleToggle loclist<cr>", "Location" },
			},
			f = {
				name = "Find",
			},
			g = {
				name = "Git",
				g = { "<cmd>LazyGit<cr>", "Lazy" },
			},
		}

		wk.register(mappings, opts)
	end,
}
