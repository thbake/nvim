local mark = require("harpoon.mark")
local ui   = require("harpoon.ui")

vim.keymap.set('n', '<leader>ha', function() mark.add_file() end, {})
vim.keymap.set('n', '<leader>ht', function() ui.toggle_quick_menu() end, {})
vim.keymap.set('n', '<leader>hn', function() ui.nav_next() end, {})
vim.keymap.set('n', '<leader>hp', function() ui.nav_prev() end, {})

vim.keymap.set("n", "<C-j>", function() ui.nav_file(1) end)
vim.keymap.set("n", "<C-k>", function() ui.nav_file(2) end)
vim.keymap.set("n", "<C-l>", function() ui.nav_file(3) end)
vim.keymap.set("n", "<C-ö> ", function() ui.nav_file(4) end)

