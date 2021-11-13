-- Highlight on yank
vim.api.nvim_exec(
  [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]],
  false
)

-- nvim_set_keymap is global
vim.api.nvim_set_keymap('n', '<Leader>ff', '<cmd>Telescope find_files<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>fg', '<cmd>Telescope live_grep<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', 'Y', 'y$', { noremap = true })
vim.api.nvim_set_keymap('n', '<up>', '<nop>', {  noremap = true })
vim.api.nvim_set_keymap('n', '<down>', '<nop>', { noremap = true })
vim.api.nvim_set_keymap('i', '<up>', '<nop>', {  noremap = true })
vim.api.nvim_set_keymap('i', '<down>', '<nop>', { noremap = true })
vim.api.nvim_set_keymap('i', '<left>', '<nop>', {  noremap = true })
vim.api.nvim_set_keymap('i', '<right>', '<nop>', { noremap = true })


vim.api.nvim_set_keymap('n', '<left>', ':bp<CR>', {  noremap = true })
vim.api.nvim_set_keymap('n', '<right>', ':bn<CR>', { noremap = true })

vim.api.nvim_set_keymap('n', 'j', 'gj', {  noremap = true })
vim.api.nvim_set_keymap('n', 'k', 'gk', { noremap = true })

vim.api.nvim_set_keymap('n', '<leader><leader>', '<c-^>', { noremap = true })
vim.api.nvim_exec(
  [[
  autocmd InsertLeave * set nopaste
  ]],
  false
)

vim.api.nvim_exec(
  [[
  augroup matchup_matchparen_hilight
    autocmd!
    autocmd ColorScheme * hi MatchParen guifg=red
  augroup end
]],
  false
)


