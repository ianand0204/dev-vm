return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use {'dracula/vim', as = 'dracula' }
--  use 'hrsh7th/cmp-nvim-lsp'
--  use {'hrsh7th/nvim-cmp'}
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path' 
  use 'hrsh7th/cmp-cmdline'
--  use 'hrsh7th/cmp-vsnip'
--  use 'hrsh7th/vim-vsnip'
  use 'saadparwaiz1/cmp_luasnip'
  use 'L3MON4D3/LuaSnip' -- Snippets plugin

  use { 'tpope/vim-fugitive' }
  use { 'airblade/vim-gitgutter'}

  use {
      'nvim-telescope/telescope.nvim',
      requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use { 'tjdevries/nlua.nvim' }
  use {'kosayoda/nvim-lightbulb'}
  use {'lukas-reineke/indent-blankline.nvim' }
  use {'nvim-lua/lsp_extensions.nvim' }
  use {'rust-lang/rust.vim' }
  use {'simrat39/rust-tools.nvim' }
  use {'mfussenegger/nvim-dap' }
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

---  use({ "mfussenegger/nvim-lint.nvim",
---    requires = {"nvim-lua/plenary.nvim", "neovim/nvim-lspconfig"}
---  })
    -- Add git related info in the signs columns and popups
  use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim'}}

use {
    'neovim/nvim-lspconfig',
    'williamboman/nvim-lsp-installer',
    'ray-x/lsp_signature.nvim',

}
use { 'airblade/vim-rooter' }
use { 'andymass/vim-matchup' }
use { 'nvim-lua/completion-nvim'}
use { 'dag/vim-fish' }
use { 'mracos/mermaid.vim' }

use {
		"onsails/lspkind-nvim",
		config = function()
			local i = require("tb.icons")

			require("lspkind").init {
				symbol_map = {
					Class = i.lang.class,
					Color = i.lang.color,
					Constant = i.lang.constant,
					Constructor = i.lang.constructor,
					Enum = i.lang.enum,
					EnumMember = i.lang.enummember,
					Event = i.lang.event,
					Field = i.lang.field,
					File = i.lang.file,
					Folder = i.lang.folder,
					Function = i.lang["function"],
					Interface = i.lang.interface,
					Keyword = i.lang.keyword,
					Method = i.lang.method,
					Module = i.lang.module,
					Operator = i.lang.operator,
					Property = i.lang.property,
					Reference = i.lang.reference,
					Snippet = i.lang.snippet,
					Struct = i.lang.struct,
					Text = i.lang.text,
					TypeParameter = i.lang.typeparameter,
					Unit = i.lang.unit,
					Value = i.lang.value,
					Variable = i.lang.variable
				}
			}
		end
	}


use {
		"hrsh7th/nvim-cmp",
		requires = "hrsh7th/cmp-nvim-lsp",
		after = "lspkind-nvim",
		config = function()
			require("cmp_nvim_lsp").setup()
			local cmp = require("cmp")
			local lspkind = require("lspkind")
			cmp.setup {
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				formatting = {
					format = function(entry, vim_item)
						vim_item.kind = lspkind.presets.default[vim_item.kind]
						return vim_item
					end
				},
				min_length = 0, -- allow for `from package import _` in Python
				mapping = {
					["<S-Tab>"] = cmp.mapping.select_prev_item(),
					["<Tab>"] = cmp.mapping.select_next_item(),
					["<C-p>"] = cmp.mapping.select_prev_item(),
					["<C-n>"] = cmp.mapping.select_next_item(),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.close()
					-- This is handled by nvim-autopairs.
					-- ["<CR>"] = cmp.mapping.confirm {
					--   behavior = cmp.ConfirmBehavior.Replace,
					--   select = true
					-- }
				},
				sources = {
					{name = "nvim_lsp"},
					{name = "buffer"},
					{name = "luasnip"},
				},
				experimental = {
					ghost_text = true
				}


			}
 -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    }
  })
		end
	}


--  if packer_bootstrap then
--    require('packer').sync()
--  end

end)
