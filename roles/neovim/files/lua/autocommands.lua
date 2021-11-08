vim.cmd 'au TextYankPost * lua vim.highlight.on_yank {on_visual = false}' 

-- nvim_set_keymap is global
vim.api.nvim_set_keymap('n', '<Leader>ff', '<cmd>Telescope find_files<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>fg', '<cmd>Telescope live_grep<cr>', { noremap = true })
