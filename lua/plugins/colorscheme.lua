return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "night",
      transparent = true,
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
        commentStyle = { italic = true },
        terminalColors = true,
      })
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
          transparent = true,
          dim_inactive = false,
          styles = {
            comments = "italic", -- <-- not working
          },
        },
      })
    end,
  },
  {
    "sainnhe/gruvbox-material",
    config = function()
      vim.g.gruvbox_material_background = "medium" -- hard, medium, soft
      vim.g.gruvbox_material_foreground = "material" -- material, mix, original
      vim.g.gruvbox_material_enable_italic = 1
      vim.g.gruvbox_material_transparent_background = 1
    end,
  },
}
