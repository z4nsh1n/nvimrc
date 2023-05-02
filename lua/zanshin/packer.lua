-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use {
  'nvim-telescope/telescope.nvim', tag = '0.1.1',
-- or                            , branch = '0.1.x',
  requires = { {'nvim-lua/plenary.nvim'} }
  }
  use ('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

  use 'jiangmiao/auto-pairs'
  use 'mbbill/undotree'
  use 'tpope/vim-fugitive'
  use ('ThePrimeagen/harpoon',{
	  requires= {{'nvim-lua/plenary.nvim'}}
  })
  --colorschemes
  use "https://github.com/Mofiqul/dracula.nvim"
  use "lunarvim/onedarker.nvim"
  use "lunarvim/darkplus.nvim"
  use "folke/tokyonight.nvim"
end)
