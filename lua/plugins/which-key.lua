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

		wk.register({
			["<leader>b"] = { name = "Buffers" },
			["<leader>s"] = { name = "Search" },
			["<leader>f"] = { name = "Find" },
			["<leader>g"] = { name = "Git" },
			["<leader>gh"] = { name = "Hunks" },
			["g"] = { name = "Go To" },
		})
	end,
}
