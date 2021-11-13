local o = vim.opt

-- settings.lua
o.writebackup = false
o.compatible = false
o.showmatch = true
o.ignorecase = true
o.tabstop = 4
o.shiftwidth = 4
o.softtabstop = 4
o.autoindent = true
o.expandtab = false
o.hlsearch = true
o.incsearch = true
o.smartcase = true
o.gdefault=true
o.number = true
o.colorcolumn="80"
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
o.completeopt = 'menu,menuone,noselect'

o.list = true
o.listchars:append("eol:↴")
o.inccommand = 'nosplit'
o.guifont = [[Fira\ Code]]
o.cmdheight=2
o.updatetime=300
o.scrolloff=2
o.showmode=false
o.joinspaces=false
o.undodir="~/.vimdid"
o.undofile = true
o.wildmenu = true
o.wildmode = "list:longest"
o.formatoptions="tc,r,q,n,b"
o.diffopt = o.diffopt + "iwhite,algorithm:patience,indent-heuristic"
o.showcmd = true
vim.g.which_key_timeout=500
o.shortmess = o.shortmess + "c" -- dont give 'ins-completion'
vim.g.load_matchit = true
vim.g.matchup_matchparen_offscreen = { method = 'popup'}
