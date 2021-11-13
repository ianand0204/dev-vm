
vim.opt.background = "dark"
vim.opt.termguicolors = true
vim.cmd("colorscheme dracula")
vim.cmd("syntax enable")

vim.g.lightline = {
  colorscheme = 'dracula',
  active = { left = { { 'mode', 'paste' }, { 'gitbranch', 'readonly', 'filename', 'modified' } } },
  component_function = { gitbranch = 'fugitive#head' },
}
