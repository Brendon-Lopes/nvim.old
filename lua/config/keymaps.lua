-- local term_opts = { silent = true }

-- Shorten function name
-- local keymap = vim.keymap.set

local function keymap(mode, oldmap, newmap, desc)
	vim.keymap.set(mode, oldmap, newmap, { noremap = true, silent = true, desc = desc })
end

--Remap space as leader key
keymap("", "<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h")
keymap("n", "<C-j>", "<C-w>j")
keymap("n", "<C-k>", "<C-w>k")
keymap("n", "<C-l>", "<C-w>l")

keymap("n", "<leader>e", ":Lex 30<cr>")

-- Better viewing
keymap("n", "n", "nzzzv")
keymap("n", "N", "Nzzzv")
keymap("n", "<C-d>", "<C-d>zz")
keymap("n", "<C-u>", "<C-u>zz")

-- Better pasting (does not yank)
keymap("v", "p", '"_dP')
keymap("x", "p", '"_dP')

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>")
keymap("n", "<C-Down>", ":resize +2<CR>")
keymap("n", "<C-Left>", ":vertical resize -2<CR>")
keymap("n", "<C-Right>", ":vertical resize +2<CR>")

-- Navigate buffers
keymap("n", "<A-l>", ":bnext<CR>")
keymap("n", "<A-h>", ":bprevious<CR>")

-- Move text up and down
keymap("n", "<A-j>", ":m .+1<CR>==")
keymap("n", "<A-k>", ":m .-2<CR>==")

-- remove highlight
keymap("n", "<leader>h", ":noh<CR>")

-- Insert --
-- Press jk fast to exit insert mode
-- keymap("i", "jk", "<ESC>")
-- keymap("i", "kj", "<ESC>")

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv^")
keymap("v", ">", ">gv^")

-- Move text up and down
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv")
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv")

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":m '>+1<CR>gv=gv")
keymap("x", "K", ":m '<-2<CR>gv=gv")
keymap("x", "<A-j>", ":m '>+1<CR>gv=gv")
keymap("x", "<A-k>", ":m '<-2<CR>gv=gv")

-- Terminal --
-- Better terminal navigation
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)
