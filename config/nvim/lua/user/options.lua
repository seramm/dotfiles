local options = {
  cmdheight = 1,
  showtabline = 0,			-- always see tab lines
  expandtab = true,
  shiftwidth = 2,
  tabstop = 2,
  number = true,			-- see lines' number
  numberwidth = 4,
  title = true,
  scrolloff = 8,                        -- minimal number of characters left before the end of the window
  mouse = "a",
  cursorline = true,
  sidescrolloff = 8,
  smartindent = true,
  termguicolors = true,
  wrap = true,
  linebreak = true,
}

for key, value in pairs(options) do
	vim.opt[key] = value
end


vim.cmd[[colorscheme tokyonight]]
