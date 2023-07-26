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
	},
	keys = {
		{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Buffers" },
		{ "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Buffers" },
		{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
		{ "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Buffers" },
	},
	opts = function()
		local actions = require("telescope.actions")

		return {
			defaults = {
				prompt_prefix = " ",
				selection_caret = " ",

				mappings = {
					i = {
						["<C-n>"] = actions.cycle_history_next,
						["<C-p>"] = actions.cycle_history_prev,

						["<C-j>"] = actions.move_selection_next,
						["<C-k>"] = actions.move_selection_previous,

						["<esc>"] = actions.close,
					},
				},
			},
		}
	end,
	config = function(_, opts)
		require("telescope").setup(opts)
	end,
}
