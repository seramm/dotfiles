local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then 
        return
end
  
bufferline.setup {
        options = {
                numbers = "ordinal",
                close_command = "Bdelete! %d",
                right_mouse_command = "Bdelete! %d",
                left_mouse_command = "buffer %d",
                middle_mouse_command = "nil",
                indicator = {
                        icon = "│",
                        style = "icon",
                },
                buffer_close_icon = '', 
                modified_icon = "●", 
                close_icon = "",
                left_trunc_marker = "",
                right_trunc_marker = "",
                max_name_length = 30,
                max_prefix_length = 10,
                tab_size = 20,
                diagnostics = false,
                diagnostics_update_in_insert = false,
                offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
        },
}
