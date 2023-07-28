local keymap = vim.keymap

vim.g.mapleader = " "

keymap.set("n", "<leader>s", ":split<Space><CR>", {})
keymap.set("n", "<leader>v", ":vsplit<Space><CR>", {})

keymap.set("n", "<leader>+", ":vertical resize +5<CR>")
keymap.set("n", "<leader>-", ":vertical resize -5<CR>")

-- Center every time I go up and down
keymap.set("n", "<C-d>", "<C-d>zz", {})
keymap.set("n", "<C-u>", "<C-u>zz", {})

-- Center every time I look for a match
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

keymap.set("n", "<leader>pv", ":vsplit<CR> <bar> :E<CR>", {})
keymap.set("n", "<leader>pe", ":Ex<CR>")

-- Move highlighted lines across the file
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Paste word over highlighted expression without losing work on paste buffer
keymap.set("x", "<leader>p", "\"_dP")

-- Apply changes made in visual mode for multiple lines
keymap.set("i", "<C-c>", "<Esc>")

-- Replace word where cursor is currently at by the following
keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")
