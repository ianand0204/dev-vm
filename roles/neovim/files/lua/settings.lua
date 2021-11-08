local o = vim.opt

-- settings.lua
o.writebackup = false
o.compatible = false
o.showmatch = true
o.ignorecase = true
o.tabstop = 4
oshiftwidth = 4
o.softtabstop = 4
o.autoindent = true
o.expandtab = true
o.hlsearch = true
o.incsearch = true
o.number = true
o.cc="80"
o.ruler = true
o.cursorline = true
o.ttyfast = true
o.mouse="a"
-- " set noswapfile
-- " set backupdir=~/.cache/vim
-- filetype plugin indent on
-- " Allow backspace in insert mode.
o.backspace="indent,eol,start"
o.laststatus=2
o.display="lastline,msgsep"
o.encoding='utf-8'
-- set autoread " auto-reread changed files
o.linebreak = true
o.showbreak=" "
o.showmode = true
o.splitright = true
o.splitbelow = true
-- Disable any annoying beeps on errors.
o.errorbells = false
o.visualbell = false

-- Set completeopt to have a better completion experience
o.completeopt = 'menuone,noselect'

o.list = true
o.listchars:append("eol:↴")
