-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use "wbthomason/packer.nvim"

	-- Colorschemes
	use "folke/tokyonight.nvim"
	use "ellisonleao/gruvbox.nvim"
	use "sainnhe/everforest"
	use "rebelot/kanagawa.nvim"

	-- Neovim statusline
	use {
		  "nvim-lualine/lualine.nvim",
		  requires = { "kyazdani42/nvim-web-devicons", opt = true }

	}
	use { -- I couldn't live without this plugin
		  'ThePrimeagen/harpoon',
		  requires = { {'nvim-lua/plenary.nvim'} }
	}
	use { -- File finder
		  'nvim-telescope/telescope.nvim', tag = '0.1.4',
		  requires = { {'nvim-lua/plenary.nvim'} }

	}
	-- LSP plugins
	use "neovim/nvim-lspconfig"

	use "hrsh7th/cmp-nvim-lsp"
	use "hrsh7th/cmp-buffer"
	use "hrsh7th/cmp-path"
	use "hrsh7th/nvim-cmp"
	use "L3MON4D3/LuaSnip"
	use "saadparwaiz1/cmp_luasnip"

	use "williamboman/mason.nvim"
	use "williamboman/mason-lspconfig.nvim"

	use {'kaarmu/typst.vim', ft = {'typst'}}

	-- Treesitter
	use {
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({
				with_sync = true
			})
			ts_update()
		end,
	}

	use { -- Autopairs (braces, brackets, etc)
		"windwp/nvim-autopairs",
		config = function() require("nvim-autopairs").setup {} end
	}

	-- LSP Support
	use { "JuliaEditorSupport/julia-vim" }

	-- Others
	use {"shortcuts/no-neck-pain.nvim", tag = "*"}

end)
