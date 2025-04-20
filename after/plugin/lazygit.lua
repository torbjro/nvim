vim.keymap.set('n', '<leader>gg', ':LazyGit<CR>', { silent = true })

vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "lazygit",
  callback = function()
    vim.api.nvim_buf_set_keymap(0, "t", "h", "", { noremap = true, silent = true })
    vim.api.nvim_buf_set_keymap(0, "t", "j", "h", { noremap = true, silent = true })
    vim.api.nvim_buf_set_keymap(0, "t", "k", "j", { noremap = true, silent = true })
    vim.api.nvim_buf_set_keymap(0, "t", "l", "k", { noremap = true, silent = true })
    vim.api.nvim_buf_set_keymap(0, "t", "ø", "l", { noremap = true, silent = true })
  end
})

