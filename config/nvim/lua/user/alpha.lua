local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
  return
end

local status_ok1, dashboard = pcall(require, "alpha.themes.dashboard")
if not status_ok1 then
  return
end

local header0 = {
  -- https://patorjk.com/software/taag/#p=display&h=2&v=0&f=ANSI%20Shadow&t=neovim
  "                                                  ",
  "                                                  ",
  "                                                  ",
  "                                                  ",
  "███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗",
  "████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║",
  "██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║",
  "██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║",
  "██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║",
  "╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝",
  "                                                  ",
  "                                                  ",
  "                    Never :qa!                    ",
}

dashboard.section.header.val = header0
dashboard.section.buttons.val = {
  dashboard.button("e", "  >  New file", ":ene <BAR> starinsert <CR>"),
  dashboard.button("q", "󰅚  >  Quit NeoVim", ":qa<CR>"),

}

dashboard.config.opts.noautocmd = true

alpha.setup(dashboard.opts)
