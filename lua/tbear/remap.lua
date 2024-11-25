vim.g.mapleader = " "
vim.keymap.set("n","<leader>pv",vim.cmd.Ex)

-- remap cursor movements in normal mode
vim.keymap.set("n", "j", "h", { desc = "remap 'h' to move down" })
vim.keymap.set("n", "k", "j", { desc = "remap 'j' to move up" })
vim.keymap.set("n", "l", "k", { desc = "remap 'k' to move right" })
vim.keymap.set("n", "ø", "l", { desc = "remap 'l' to custom character" })

vim.keymap.set("n", "J", "H", { desc = "remap 'H' to move down (uppercase)" })
vim.keymap.set("n", "K", "J", { desc = "remap 'J' to move up (uppercase)" })
vim.keymap.set("n", "L", "K", { desc = "remap 'K' to move right (uppercase)" })
vim.keymap.set("n", "Ø", "L", { desc = "remap 'L' to custom character (uppercase)" })

-- remap cursor movements in visual mode
vim.keymap.set("v", "j", "h", { desc = "remap 'h' to move down" })
vim.keymap.set("v", "k", "j", { desc = "remap 'j' to move up" })
vim.keymap.set("v", "l", "k", { desc = "remap 'k' to move right" })
vim.keymap.set("v", "ø", "l", { desc = "remap 'l' to custom character" })

vim.keymap.set("v", "J", "H", { desc = "remap 'H' to move down (uppercase)" })
vim.keymap.set("v", "K", "J", { desc = "remap 'J' to move up (uppercase)" })
vim.keymap.set("v", "L", "K", { desc = "remap 'K' to move right (uppercase)" })
vim.keymap.set("v", "Ø", "L", { desc = "remap 'L' to custom character (uppercase)" })

-- vim.keymap.set("n", "<C-j>", "<C-w>h", { noremap = true, silent = true }) -- Move to the window to the left
-- vim.keymap.set("n", "<C-k>", "<C-w>j", { noremap = true, silent = true }) -- Move to the window below
-- vim.keymap.set("n", "<C-l>", "<C-w>k", { noremap = true, silent = true }) -- Move to the window above
-- vim.keymap.set("n", "<C-ø>", "<C-w>l", { noremap = true, silent = true }) -- Move to the window to the right

-- move highlighted lines, J to move up, K down
vim.keymap.set("v", "K", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "L", ":m '<-2<CR>gv=gv")

-- J adds line below to current line with a space between
-- this remap will make the cursor stay in the same place
vim.keymap.set("n", "J", "mzJ`z")

-- make cursor stay in the same RELATIVE space when moving half pages up/down
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
-- search terms stay in the middle of the screen
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- make the words pasted over not be in buffer, into void. Keeps the current buffer when pasting
vim.keymap.set("x", "<leader>p", "\"_dP")

-- leader y to yank to system clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- nop for ctrl Q
vim.keymap.set("n", "Q", "<nop>")

-- save with ctrl-s
vim.keymap.set({ "n", "i" }, "<C-s>", "<Cmd>w<CR>", { noremap = true, silent = true })

-- open new project with tmux
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", function ()
    vim.lsp.buf.format()
end)

-- replace the word currently on
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- make file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- open nvim tree
vim.keymap.set("n", "<leader>to", "<cmd>NvimTreeOpen<CR>", { desc = "open up nvimtree" })
vim.keymap.set("n", "<leader>tc", "<cmd>NvimTreeClose<CR>", { desc = "close nvimtree" })
vim.keymap.set("n", "<leader>tt", "<cmd>NvimTreeToggle<CR>", { desc = "toggle nvimtree" })

-- tmux
vim.g.tmux_navigator_no_mappings = 1

vim.g.tmux_navigator_no_mappings = 1

vim.keymap.set('n', '<C-j>', ':TmuxNavigateLeft<CR>', { silent = true , noremap = true})
vim.keymap.set('n', '<C-k>', ':TmuxNavigateDown<CR>', { silent = true , noremap = true})
vim.keymap.set('n', '<C-l>', ':TmuxNavigateUp<CR>', { silent = true , noremap = true})
vim.keymap.set('n', '<C-ø>', ':TmuxNavigateRight<CR>', { silent = true , noremap = true})
vim.keymap.set('n', '<C-\\>', ':TmuxNavigatePrevious<CR>', { silent = true , noremap = true})
