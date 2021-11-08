"let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
"if empty(glob(data_dir . '/autoload/plug.vim'))
"  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
"  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
"endif
" Fix issues with fish shell
" https://github.com/tpope/vim-sensible/issues/50
#if &shell =~# 'fish$' && (v:version < 704 || v:version == 704 && !has('patch276'))
#  set shell=/usr/bin/env\ bash
#endif
#
#let mapleader = "\<Space>"
#
"call plug#begin(stdpath('data') . '/plugged')
"Plug 'dracula/vim', { 'as': 'dracula' }
"Plug 'neovim/nvim-lspconfig'
"Plug 'williamboman/nvim-lsp-installer'
"Plug 'hrsh7th/cmp-nvim-lsp'
"Plug 'hrsh7th/cmp-buffer'
"Plug 'hrsh7th/cmp-path'
"Plug 'hrsh7th/cmp-cmdline'
"Plug 'hrsh7th/nvim-cmp'
"Plug 'rust-lang/rust.vim'
"Plug 'vim-syntastic/syntastic'
"Plug 'preservim/tagbar'
"Plug 'universal-ctags/ctags'
"Plug 'dag/vim-fish'
"Plug 'tpope/vim-fugitive'
"Plug 'ryanoasis/vim-devicons'
"Plug 'scrooloose/nerdtree'
"
"call plug#end()

" set noswapfile
" set backupdir=~/.cache/vim
filetype plugin indent on
" Allow backspace in insert mode.

" Delete comment character when joining commented lines
if v:version > 703 || v:version == 703 && has("patch541")
  set formatoptions+=j
endif

" color schemes
" if (has("termguicolors"))
" set termguicolors
" endif
" syntax enable
"" colorscheme evening
"colorscheme dracula
"set splitright
"set splitbelow
"" Disable any annoying beeps on errors.
"set noerrorbells
"set visualbell
"nmap <Leader><Leader> V
"if has('nvim')
"    set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor
"    set inccommand=nosplit
"    noremap <C-q> :confirm qall<CR>
"end
"
