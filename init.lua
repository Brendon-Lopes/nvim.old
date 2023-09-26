require("config")

-- Lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

-- Colorscheme
-- vim.cmd.colorscheme("tokyonight")
vim.cmd.colorscheme("kanagawa-wave")
-- vim.cmd.colorscheme("OceanicNext")
-- vim.cmd.colorscheme("duskfox")
-- vim.cmd.colorscheme("nightfox")
-- vim.cmd.colorscheme("gruvbox-material")
