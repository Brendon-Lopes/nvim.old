return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			style = "night",
			transparent = false,
			styles = {
				sidebars = "transparent",
				floats = "transparent",
			},
		},
	},
	{
		"rebelot/kanagawa.nvim",
		config = function()
			require("kanagawa").setup({
				transparent = true,
				keywordStyle = { italic = true },
				statementStyle = { bold = true },
			})
		end,
	},
	{
		"rafamadriz/neon",
		config = function()
			local g = vim.g

			g.neon_style = "doom"
			g.neon_transparent = true
			g.neon_italic_keywork = true
			g.neon_italic_boolean = true
			g.neon_italic_function = true
			g.neon_italic_variable = true
			g.neon_bold = false
		end,
	},
	{
		"mhartington/oceanic-next",
		config = function()
			local g = vim.g

			g.oceanic_next_terminal_bold = 1
			g.oceanic_next_terminal_italic = 1
		end,
	},
	{
		"EdenEast/nightfox.nvim",
		config = function()
			require("nightfox").setup({
				options = {
					transparent = false,
					dim_inactive = false,
					styles = {
						comments = "italic", -- <-- not working
					},
				},
			})
		end,
	},
}
