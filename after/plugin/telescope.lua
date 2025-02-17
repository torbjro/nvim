local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.git_files, { desc = 'Telescope find git files' })
vim.keymap.set('n', '<leader>fl', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fs', function()
    builtin.grep_string({ search = vim.fn.input("grep > ") });
end)
vim.keymap.set('n', '<leader>fo', builtin.oldfiles, { desc = 'Telescope find old files' })
vim.keymap.set("n", "<space>fc", function()
  builtin.find_files { cwd = vim.fn.stdpath "config" }
end)
