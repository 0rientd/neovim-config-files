-- Some custom configurations
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "

vim.keymap.set('n', '<leader>gd', ':! git diff --graph<CR>', {})
vim.keymap.set('n', '<leader>gs', ':! git status<CR>', {})
vim.keymap.set('n', '<leader>gp', ':! git pull<CR>', {})
