-- Some custom configurations
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "

-- Preciso ajustar o plugin para exibir o retorno dos comandos
-- vim.keymap.set('n', '<leader>gs', ':! git status<CR>', {})
vim.keymap.set('n', '<leader>gp', ':! git pull<CR>', {})
vim.keymap.set('n', '<leader>gd', ':DiffviewOpen<CR>', {})

vim.env.ASDF_DIR = "/home/dev/.asdf"
vim.env.PATH = vim.env.ASDF_DIR .. "/shims:" .. vim.env.PATH
