local function augroup(name)
  return vim.api.nvim_create_augroup(name, { clear = true })
end

-- don't auto comment new line
vim.api.nvim_create_autocmd("BufEnter", {
  group = augroup("disable_auto_comment"),
  command = [[set formatoptions-=cro]],
})

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup("highlight_yank"),
  callback = function()
    vim.highlight.on_yank()
  end,
})
