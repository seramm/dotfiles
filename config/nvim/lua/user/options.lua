local options = {
  cmdheight = 1,
  showtabline = 0,			-- always see tab lines
  expandtab = true,                     -- insert 2 spaces for a tab
  number = true,			-- see lines' number
  numberwidth = 4,
  title = true,
  scrolloff = 8,                        -- minimal number of characters left before the end of the window
  mouse = "a",
  sidescrolloff = 8,
  smartindent = true,
}

for key, value in pairs(options) do
	vim.opt[key] = value
end


vim.cmd[[colorscheme tokyonight]]
