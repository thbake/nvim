local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>td', builtin.diagnostics, {})

require('telescope').setup {
	defaults = {
		file_ignore_patterns = {
			"miniconda3/*",
			"Brave/*",
			"/Microsoft/*",
			"xournal/*",
			".julia/*",
			".cargo/*",
			"neovim/*",
			".vim/plugged/*",
			".cache/*",
			"build/*",
			".git/*",
			".github/*",
			}
		}
	}
