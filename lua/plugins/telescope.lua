return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.2",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			config = function()
				require("telescope").load_extension("fzf")
			end,
		},
		{
			"nvim-telescope/telescope.nvim",
		},
	},
	keys = {
		{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "File" },
		{ "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Grep" },
		{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
		{ "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help" },
	},
	opts = function()
		local actions = require("telescope.actions")
		local trouble = require("trouble.providers.telescope")

		return {
			defaults = {
				prompt_prefix = "  ",
				selection_caret = " ",

				mappings = {
					i = {
						["<C-n>"] = actions.cycle_history_next,
						["<C-p>"] = actions.cycle_history_prev,

						["<C-j>"] = actions.move_selection_next,
						["<C-k>"] = actions.move_selection_previous,

						["<esc>"] = actions.close,

						["<C-t>"] = trouble.open_with_trouble,
					},
					n = {
						["<C-t>"] = trouble.open_with_trouble,
					},
				},
			},
		}
	end,
	config = function(_, opts)
		require("telescope").setup(opts)
	end,
}
