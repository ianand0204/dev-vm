return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use {'dracula/vim', as = 'dracula' }
  use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path' 
  use 'hrsh7th/cmp-cmdline'
--  use 'hrsh7th/cmp-vsnip'
--  use 'hrsh7th/vim-vsnip'
  use 'saadparwaiz1/cmp_luasnip'
  use 'L3MON4D3/LuaSnip' -- Snippets plugin

  use { 'tpope/vim-fugitive' }
  use {
      'nvim-telescope/telescope.nvim',
      requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use { 'tjdevries/nlua.nvim' }
  use {'kosayoda/nvim-lightbulb'}
  use {'lukas-reineke/indent-blankline.nvim' }

  require("indent_blankline").setup {
    show_end_of_line = true,
  }

  use 'itchyny/lightline.vim' -- Fancier statusline

  use {
    'nvim-treesitter/nvim-treesitter',
    requires = {
      'nvim-treesitter/nvim-treesitter-refactor',
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    run = ':TSUpdate',
  }

  use({ "mfussenegger/nvim-lint.nvim",
    requires = {"nvim-lua/plenary.nvim", "neovim/nvim-lspconfig"}
  })
    -- Add git related info in the signs columns and popups
  use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim'}}

use {
    'neovim/nvim-lspconfig',
    'williamboman/nvim-lsp-installer',
    'ray-x/lsp_signature.nvim',

}
use { 'airblade/vim-rooter' }
use { 'andymass/vim-matchup' }
-- local function prequire(...)
--local status, lib = pcall(require, ...)
--if (status) then return lib end
--    return nil
--end

-- local luasnip = prequire('luasnip')
--local cmp = prequire("cmp")
--
--local t = function(str)
--    return vim.api.nvim_replace_termcodes(str, true, true, true)
--end
--
--local check_back_space = function()
--    local col = vim.fn.col('.') - 1
--    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
--        return true
--    else
--        return false
--    end
--end
--
--_G.tab_complete = function()
--    if cmp and cmp.visible() then
--        cmp.select_next_item()
--    elseif luasnip and luasnip.expand_or_jumpable() then
--        return t("<Plug>luasnip-expand-or-jump")
--    elseif check_back_space() then
--        return t "<Tab>"
--    else
--        cmp.complete()
--    end
--    return ""
--end
--_G.s_tab_complete = function()
--    if cmp and cmp.visible() then
--        cmp.select_prev_item()
--    elseif luasnip and luasnip.jumpable(-1) then
--        return t("<Plug>luasnip-jump-prev")
--    else
--        return t "<S-Tab>"
--    end
--    return ""
--end
--
--vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
--vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
--vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
--vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
--vim.api.nvim_set_keymap("i", "<C-E>", "<Plug>luasnip-next-choice", {})
--vim.api.nvim_set_keymap("s", "<C-E>", "<Plug>luasnip-next-choice", {})

  if packer_bootstrap then
    require('packer').sync()
  end

end)
