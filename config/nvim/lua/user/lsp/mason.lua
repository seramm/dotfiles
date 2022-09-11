local status_ok, mason = pcall(require, "mason")
if not status_ok then
  return
end

local status_ok1, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok1 then
  return
end

local servers = {
  "clangd",
  "jdtls",
  "lua-language-server",
  "marksman",
  "pyright",
  "sqlls",
  "taplo"
}

local settings = {
    ui = {
        check_outdated_packages_on_open = true,
        border = "rounded",
        icons = {
            package_installed = "◍",
            package_pending = "◍",
            package_uninstalled = "◍",
        },
    },
}

mason.setup(settings)
mason_lspconfig.setup {
  ensure_installed = servers,
  automatic_installation = true,
}
