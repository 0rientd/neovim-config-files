-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Some custom configurations
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "

-- Lazy configuration
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- All plugins used
local plugins = {
  {"nvim-treesitter/nvim-treesitter", branch = 'master', lazy = false, build = ":TSUpdate"},
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  {
    'nvim-telescope/telescope.nvim', tag = 'v0.1.9',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  {
    "preservim/nerdtree",
    cmd = { "NERDTree", "NERDTreeToggle" },
    keys = {
      { "<C-n>", ":NERDTreeToggle<CR>", desc = "Toggle NERDTree" }
    },
    config = function()
      vim.g.NERDTreeShowHidden = 1   -- optional: show .files
    end
  },
}

local opts = {}

require("lazy").setup(plugins, opts)

-- Auto-open NERDTree when opening Neovim with a directory
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function(data)
    local is_directory = vim.fn.isdirectory(data.file) == 1
    if not is_directory then
      return
    end

    vim.cmd.cd(data.file)

    vim.cmd("NERDTree")
  end
})

-- Telescope mappings
local builtin = require("telescope.builtin")
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})

-- Treesitter
local config = require("nvim-treesitter.configs")
config.setup({
  ensure_installed = { "javascript", "ruby", "html", "vim", "markdown", "query", "css", "json", "typescript", "yaml", "tsx", "gitignore", "dockerfile", "diff", "c", "bash", },
  highlight = { enable = true },
  indent = { enable = true },
})

-- Theme
require("catppuccin")
vim.cmd.colorscheme "catppuccin-mocha"
