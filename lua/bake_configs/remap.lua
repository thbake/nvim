vim.g.mapleader = " "

vim.keymap.set("n", "<leader>s", ":split<Space><CR>", {})
vim.keymap.set("n", "<leader>v", ":vsplit<Space><CR>", {})

vim.keymap.set("n", "<leader>+", ":vertical resize +5<CR>")
vim.keymap.set("n", "<leader>-", ":vertical resize -5<CR>")

-- Center every time I go up and down
vim.keymap.set("n", "<C-d>", "<C-d>zz", {})
vim.keymap.set("n", "<C-u>", "<C-u>zz", {})

-- Center every time I look for a match
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>pv", ":vsplit<CR> <bar> :E<CR>", {})
vim.keymap.set("n", "<leader>pe", ":Ex<CR>")

-- Move highlighted lines across the file
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Paste word over highlighted expression without losing work on paste buffer
vim.keymap.set("x", "<leader>p", "\"_dP") 

-- Apply changes made in visual mode for multiple lines
vim.keymap.set("i", "<C-c>", "<Esc>")

-- Replace word where cursor is currently at by the following
vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")
