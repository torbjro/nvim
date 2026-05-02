require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

vim.api.nvim_create_autocmd("BufEnter", {
  callback = function(ev)
    local ft = vim.bo[ev.buf].filetype
    if ft == "mason" then
      vim.defer_fn(function()
        pcall(function()
          vim.api.nvim_buf_set_option(ev.buf, "modifiable", true)
          vim.api.nvim_buf_set_option(ev.buf, "readonly", false)
        end)
      end, 100)
    end
  end
})
