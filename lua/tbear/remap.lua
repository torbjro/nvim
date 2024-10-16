vim.g.mapleader = " "
vim.keymap.set("n","<leader>pv",vim.cmd.Ex)

-- move highlighted lines, J to move up, K down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- J adds line below to current line with a space between
-- this remap will make the cursor stay in the same place
vim.keymap.set("n", "J", "mzJ`z")

-- make cursor stay in the same RELATICE space when moving half pages up/down
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

-- open new project with tmux
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", function ()
    vim.lsp.buf.format()
end)

-- replace the word currently on
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- make file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
