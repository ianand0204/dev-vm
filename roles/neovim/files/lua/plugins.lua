vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use {'dracula/vim', as = 'dracula'}

    use {'tpope/vim-fugitive'}
    use {'airblade/vim-gitgutter'}

    use {'rust-lang/rust.vim'}
    use {'simrat39/rust-tools.nvim'}

    use {'itchyny/lightline.vim'} -- Fancier statusline
    use {'gabrielelana/vim-markdown'}

    use {'airblade/vim-rooter'}
    use {'andymass/vim-matchup'}
    use {'dag/vim-fish'}
    use {'mracos/mermaid.vim'}

    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'

    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip'

    -- LSP
    use 'neovim/nvim-lspconfig'
    use 'nvim-lua/lsp_extensions.nvim'
    use 'nvim-lua/completion-nvim'
    -- Searching
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}

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
                        vim.fn["vsnip#anonymous"](args.body)
                    end
                    -- j	expand = function(args)
                    --		luasnip.lsp_expand(args.body)
                    ---	end,
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
                    {name = "nvim_lsp"}, {name = "vsnip"}, {name = "path"},
                    {name = "buffer"}
                },
                experimental = {ghost_text = true}

            }
            -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
            cmp.setup.cmdline(':', {
                sources = cmp.config
                    .sources({{name = 'path'}}, {{name = 'cmdline'}})
            })

            -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
            cmp.setup.cmdline('/', {sources = {{name = 'buffer'}}})
        end
    }

    --	 if packer_bootstrap then
    --	   require('packer').sync()
    --	end

end)
