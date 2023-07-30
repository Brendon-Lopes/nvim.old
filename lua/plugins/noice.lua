return {
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			{ "MunifTanjim/nui.nvim" },
			{
				"rcarriga/nvim-notify",
				config = function()
					vim.notify = require("notify")
				end,
			},
		},
		config = function()
			require("noice").setup({
				cmdline = {
					enabled = true,
					view = "cmdline",
				},
				lsp = {
					progress = {
						enabled = false,
					},
					override = {
						["vim.lsp.util.convert_input_to_markdown_lines"] = true,
						["vim.lsp.util.stylize_markdown"] = true,
						["cmp.entry.get_documentation"] = true,
					},
				},
				presets = {
					lsp_doc_border = true,
				},
			})
		end,
     -- stylua: ignore
    keys = {
      { "<leader>sx", function() require("noice").cmd("dismiss") end, desc = "Dismiss Notifications" },
    },
	},
}
