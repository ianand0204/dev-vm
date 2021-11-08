return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use {'dracula/vim', as = 'dracula' }
  use {'neovim/nvim-lspconfig'}
  use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  use 'hrsh7th/cmp-nvim-lsp'
  use { 'tpope/vim-fugitive' }
  use {
      'nvim-telescope/telescope.nvim',
      requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }
  use { 'tjdevries/nlua.nvim' }
  use {'kosayoda/nvim-lightbulb'}
  use {"lukas-reineke/indent-blankline.nvim"}

  require("indent_blankline").setup {
    show_end_of_line = true,
  }

  if packer_bootstrap then
    require('packer').sync()
  end

end)
