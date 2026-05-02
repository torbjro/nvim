require('lsp_signature').setup{
    bind = true,
    handler_opts = {
        border = "rounded",
    },
    always_trigger = true,
    extra_trigger_chars = { "(", "," },
    transparency = nil,
    zindex = 200,
    floating_window = true,
    floating_window_above_cur_line = false,
    floating_window_off_y = function ()
        local sig_height = 4
        local winline = vim.fn.winline()
        local winheight = vim.fn.winheight(0)
        local space_below = winheight - winline
        if space_below >= sig_height + 1 then
            return 1
        end
        return -1
    end,
}
