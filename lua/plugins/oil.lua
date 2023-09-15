return {
  {
    "stevearc/oil.nvim",
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("oil").setup()
      vim.keymap.set("n", "-", require("oil").open, { desc = "Open parent directory" })
      -- TODO: remap <C-h> to not open horizontal split, only change between splits
    end,
  },
}
