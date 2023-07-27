return {
	{
		"jose-elias-alvarez/typescript.nvim",
		opts = {
			disable_commands = false,
			debug = false,
			go_to_source_definition = {
				fallback = true,
			},
		},
		config = function(_, opts)
			require("typescript").setup(opts)
		end,
	},
}
