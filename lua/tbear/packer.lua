-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use {
	'nvim-telescope/telescope.nvim', tag = '0.1.8',
	-- or                            , branch = '0.1.x',
	requires = { {'nvim-lua/plenary.nvim'} }
  }
  use ( 'theprimeagen/harpoon' )
  use { "ellisonleao/gruvbox.nvim" }
  use ( 'nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'} )
  use ( 'nvim-treesitter/playground' )
  use { "williamboman/mason.nvim" }
  use ({'VonHeikemen/lsp-zero.nvim', branch = 'v4.x'})
  use ({'neovim/nvim-lspconfig'})
  use ({'hrsh7th/nvim-cmp'})
  use ({'hrsh7th/cmp-nvim-lsp'})
end)
