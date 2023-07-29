--[[ return {
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
} ]]
return {
	{
		"nvim-telescope/telescope.nvim",
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
		cmd = "Telescope",
		keys = {
			{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
			{ "<leader>ff", "<cmd>lua require('functions').find_files_from_project_git_root()<CR>", desc = "Files" },
			{ "<leader>sg", "<cmd>lua require('functions').live_grep_from_project_git_root()<CR>", desc = "Live Grep" },
			{
				"<leader>sb",
				"<cmd>Telescope current_buffer_fuzzy_find<cr>",
				desc = "Current Buffer",
			},
			{
				"<leader>sd",
				"<cmd>Telescope diagnostics bufnr=0<cr>",
				desc = "Document diagnostics",
			},
			{
				"<leader>sD",
				"<cmd>Telescope diagnostics<cr>",
				desc = "Workspace diagnostics",
			},
			{ "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Help Pages" },
		},
		opts = function()
			local actions = require("telescope.actions")
			local action_layout = require("telescope.actions.layout")
			local telescopeConfig = require("telescope.config")

			local vimgrep_arguments = {}

			if
				telescopeConfig.values.vimgrep_arguments ~= nil
				and type(telescopeConfig.values.vimgrep_arguments) == "table"
			then
				---@diagnostic disable-next-line: deprecated
				vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }
			end

			table.insert(vimgrep_arguments, "-g")
			table.insert(vimgrep_arguments, "!**/assets/*")
			table.insert(vimgrep_arguments, "-g")
			table.insert(vimgrep_arguments, "!**/public/*")
			table.insert(vimgrep_arguments, "-g")
			table.insert(vimgrep_arguments, "!package-lock.json")

			return {
				defaults = {
					prompt_prefix = "  ",
					selection_caret = " ",
					-- layout_config = {
					-- 	horizontal = {
					-- 		width = 0.95,
					-- 		height = 0.95,
					-- 		preview_width = 0.6,
					-- 	},
					-- },
					vimgrep_arguments = vimgrep_arguments,
					previewer = false,
					hidden = true,
					dynamic_preview_title = true,
					initial_mode = "insert",
					select_strategy = "reset",
					sorting_strategy = "ascending",
					layout_strategy = "horizontal",
					mappings = {
						i = {
							["<C-t>"] = function(...)
								return require("trouble.providers.telescope").open_with_trouble(...)
							end,
							["<C-p>"] = action_layout.toggle_preview,
						},
						n = {
							["q"] = function(...)
								return require("telescope.actions").close(...)
							end,
							["<C-p>"] = action_layout.toggle_preview,
						},
					},
				},
				pickers = {
					find_files = {
						find_command = {
							"rg",
							"--files",
							"-g",
							"!**/assets/*",
							"-g",
							"!**/public/*",
							"-g",
							"!package-lock.json",
						},
						previewer = true,
						-- layout_config = {
						-- 	horizontal = {
						-- 		width = 0.5,
						-- 		height = 0.4,
						-- 	},
						-- },
					},
					git_files = {
						find_command = {
							"rg",
							"--files",
							"-g",
							"!**/assets/*",
							"-g",
							"!**/public/*",
							"-g",
							"!package-lock.json",
						},
						previewer = false,
						-- layout_config = {
						-- 	horizontal = {
						-- 		width = 0.5,
						-- 		height = 0.4,
						-- 	},
						-- },
					},
					buffers = {
						previewer = false,
						-- layout_config = {
						-- 	horizontal = {
						-- 		width = 0.5,
						-- 		height = 0.4,
						-- 	},
						-- },
						mappings = {
							i = {
								["<c-d>"] = actions.delete_buffer + actions.move_to_top,
							},
							n = {
								["d"] = actions.delete_buffer + actions.move_to_top,
							},
						},
					},
					live_grep = {
						only_sort_text = true,
						find_command = { "rg", "-g", "!**/assets/*", "-g", "!**/public/*", "-g", "!package-lock.json" },
						previewer = true,
						-- layout_config = {
						-- 	horizontal = {
						-- 		width = 0.9,
						-- 		height = 0.75,
						-- 		preview_width = 0.6,
						-- 	},
						-- },
					},
					grep_string = {
						find_command = { "rg", "-g", "!**/assets/*", "-g", "!**/public/*", "-g", "!package-lock.json" },
						only_sort_text = true,
						previewer = true,
						-- layout_config = {
						-- 	horizontal = {
						-- 		width = 0.9,
						-- 		height = 0.75,
						-- 		preview_width = 0.6,
						-- 	},
						-- },
					},
					lsp_references = {
						show_line = false,
						previewer = true,
						-- layout_config = {
						-- 	horizontal = {
						-- 		width = 0.9,
						-- 		height = 0.75,
						-- 		preview_width = 0.6,
						-- 	},
						-- },
					},
				},
				extensions = {
					fzf = {
						fuzzy = true,
						override_generic_sorter = true,
						override_file_sorter = true,
						case_mode = "smart_case",
					},
				},
			}
		end,
		config = function(_, opts)
			require("telescope").setup(opts)
		end,
	},
}
