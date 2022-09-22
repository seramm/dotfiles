local status_ok, mason = pcall(require, "mason")
if not status_ok then
  return
end

local status_ok_1, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok_1 then
  return
end


local servers = {
  "clangd",
  "clang-format",
  "lua-language-server",
  "marksman",
  "pyright",
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
        keymaps = {
            toggle_package_expand = "<CR>",
            install_package = "i",
            update_package = "u",
            check_package_version = "c",
            update_all_packages = "U",
            check_outdated_packages = "C",
            uninstall_package = "X",
            cancel_installation = "<C-c>",
            apply_language_filter = "<C-f>",
        },
    },
}

mason.setup(settings)
mason_lspconfig.setup{
  ensure_installed = servers,
}
