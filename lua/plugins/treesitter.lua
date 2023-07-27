return {
	{
		"nvim-treesitter/playground",
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		opts = {
			auto_install = true,
			context_commentstring = { enable = true, enable_autocmd = false },
			highlight = { enable = true },
			indent = { enable = true },
			ensure_installed = {
				"bash",
				"dockerfile",
				"html",
				"javascript",
				"json",
				"lua",
				"markdown",
				"python",
				"regex",
				"toml",
				"tsx",
				"typescript",
				"vim",
				"vimdoc",
				"yaml",
				"c_sharp",
			},
			playground = {
				enable = true,
			},
		},
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
}
