return {
	{
		"j-hui/fidget.nvim",
		tag = "legacy",
		event = "LspAttach",
		opts = {
			window = {
				blend = 0,
				border = "rounded",
			},
		},
		config = function(_, opts)
			require("fidget").setup(opts)
		end,
	},
}
