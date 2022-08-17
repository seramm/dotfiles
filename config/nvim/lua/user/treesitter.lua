local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
        return
end


configs.setup{
        ensure_installed = {"bash", "c", "java", "javascript", "lua", "python", "sql", "vim", "yaml"},
        sysnc_install = false, 
        ignore_install = { "" },
        highlight = {
                enable = true,
                disable = { "" },
                additional_vim_regex_highlighting = false,
        },
        autopairs = {
                enable = true,
        },
        indent = {enable = true, disable = { "" } },
        rainbow = {
                enable = true,
        }

}

