-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use 'folke/tokyonight.nvim'

  use 'nvim-lua/plenary.nvim'

  use {
      'nvim-telescope/telescope.nvim', tag = '0.1.0',
  }

  use {
      'neoclide/coc.nvim', branch = 'release',
  }

  use('nvim-treesitter/nvim-treesitter', {
      run = ':TSUpdate'
  })
end)

