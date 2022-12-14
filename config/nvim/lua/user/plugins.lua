local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
---@diagnostic disable-next-line: missing-parameter
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  -- snapshot = "july-24",
  snapshot_path = fn.stdpath "config" .. "/snapshots",
  max_jobs = 50,
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
    prompt_border = "rounded", -- Border style of prompt popups.
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- Plugin Mangager
  use "wbthomason/packer.nvim" -- Have packer manage itself


  -- Plugins
  use "norcalli/nvim-colorizer.lua"
  use "goolord/alpha-nvim"
  use "kyazdani42/nvim-web-devicons"
  use "akinsho/toggleterm.nvim"
  use "lewis6991/impatient.nvim"

  -- Syntax
  use "windwp/nvim-autopairs"
  use "abecodes/tabout.nvim"

  -- Treesitter
  use "nvim-treesitter/nvim-treesitter"
  use "p00f/nvim-ts-rainbow"

  -- LSP
  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"
  use "neovim/nvim-lspconfig"
  --use "ray-x/lsp_signature.nvim"
  use "RRethy/vim-illuminate"
  use "jose-elias-alvarez/null-ls.nvim"

  --Completion
  use "christianchiarulli/nvim-cmp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-cmdline"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-emoji"
  use "hrsh7th/cmp-nvim-lua"
  use "saadparwaiz1/cmp_luasnip"

  --git
  use "lewis6991/gitsigns.nvim"

  --Snippet
  use "L3MON4D3/LuaSnip"
  use"rafamadriz/friendly-snippets"

  -- Telescope
  use {'nvim-telescope/telescope.nvim', tag = '0.1.0', requires = { {'nvim-lua/plenary.nvim'} } }

  -- Nvim Tree
  use({"kyazdani42/nvim-tree.lua", commit = "3676e0b124c2a132857e2bbcf7f48f05228f1052"})

  -- Keybindings
  use "folke/which-key.nvim"

  -- Color Scheme
  use "folke/tokyonight.nvim"

  -- UI
  use {'akinsho/bufferline.nvim', tag = "v2.*"}
  use "moll/vim-bbye"
  use "nvim-lualine/lualine.nvim"


  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
