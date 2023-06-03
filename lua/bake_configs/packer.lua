-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  
  -- Colorschemes
  use 'folke/tokyonight.nvim'
  use "ellisonleao/gruvbox.nvim"
  use 'sainnhe/everforest'

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
		  'nvim-telescope/telescope.nvim', tag = '0.1.0',
		  requires = { {'nvim-lua/plenary.nvim'} }

  }
  -- LSP plugins
  use {
	  'VonHeikemen/lsp-zero.nvim',
	  requires = {
		-- LSP Support
		{'neovim/nvim-lspconfig'},
		{'williamboman/mason.nvim'},
		{'williamboman/mason-lspconfig.nvim'},

		-- Autocompletion
		{'hrsh7th/nvim-cmp'},
		{'hrsh7th/cmp-buffer'},
		{'hrsh7th/cmp-path'},
		{'saadparwaiz1/cmp_luasnip'},
		{'hrsh7th/cmp-nvim-lsp'},
		{'hrsh7th/cmp-nvim-lua'},

		-- Snippets
		{'L3MON4D3/LuaSnip'},
		{'rafamadriz/friendly-snippets'},
	  }
  }

  use { -- Autopairs (braces, brackets, etc)
		  "windwp/nvim-autopairs",
		  config = function() require("nvim-autopairs").setup {} end
  }
  use "vim-test/vim-test" -- Testing

  use "ThePrimeagen/vim-be-good"

  use ("nvim-treesitter/nvim-treesitter", {run = ":TSUpdate"})

  use "untitled-ai/jupyter_ascending.vim"

  use { "JuliaEditorSupport/julia-vim" }

end)
