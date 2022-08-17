M = {}
local opts = { noremap = true, silent = true }
local term_opts = { silent = truee }

local keymap = vim.api.nvim_set_keymap

keymap("n", "<Space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap("n", "<C-Space>", "<cmd>WhichKey<cr>", opts)

-- Find files using Telescope command-line sugar.
keymap("n", "ff", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "fg", "<cmd>Telescope live_grep<cr>", opts)
keymap("n", "fb", "<cmd>Telescope buffers<cr>", opts)
keymap("n", "fh", "<cmd>Telescope help_tags<cr>", opts)

-- Nvim Tree
keymap("n", "<Space>e", "<cmd>NvimTreeToggle<cr>", opts)

return M
