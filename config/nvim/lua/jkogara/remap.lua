-- Convert any commented vim commands to lua
-- nnoremap ' <Nop>
-- let mapleader="'"
-- let maplocalleader="'"

vim.api.nvim_set_keymap('n', "'", '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = "'"
vim.g.maplocalleader = "'"
vim.opt.timeout = true
vim.opt.timeoutlen = 3000
vim.opt.ttimeoutlen = 50

-- " Map option+left and option+right arrows to jump world
vim.api.nvim_set_keymap('n', '<ESC>f', 'el', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<ESC>b', '<C-o>b', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<ESC>f', '<C-o>e', { noremap = true, silent = true })
vim.api.nvim_set_keymap('c', '<ESC>f', 'e', { noremap = true, silent = true })
