M = {}
local opts = { noremap = true, silent = true }
local term_opts = { silent = truee }

local keymap = vim.api.nvim_set_keymap

keymap("n", "<Space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap("n", "<C-Space>", "<cmd>WhichKey<cr>", opts)


-- Splits --
keymap("n", "vvq", "<C-w>q", opts)

-- Navigation 
keymap("n", "<m-h>", "<C-w>h", opts)
keymap("n", "<m-j>", "<C-w>j", opts)
keymap("n", "<m-k>", "<C-w>k", opts)
keymap("n", "<m-l>", "<C-w>l", opts)

-- Resize
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)


-- Telescope -- 
-- Find files using Telescope command-line sugar.
keymap("n", "ff", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "fg", "<cmd>Telescope live_grep<cr>", opts)
keymap("n", "fb", "<cmd>Telescope buffers<cr>", opts)
keymap("n", "fh", "<cmd>Telescope help_tags<cr>", opts)


return M
