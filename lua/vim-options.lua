-- =========================================
-- Neovim Custom Options
-- Cross-platform compatible (Windows/Mac/Linux)
-- =========================================

-- Detect operating system
local is_windows = vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1
local is_mac = vim.fn.has("macunix") == 1
local is_linux = vim.fn.has("unix") == 1 and not is_mac

-- Detect WSL (works on Linux side)
local is_wsl = false
if is_linux then
  local f = io.open("/proc/version", "r")
  if f then
    local version = f:read("*all")
    f:close()
    is_wsl = version:lower():match("microsoft") ~= nil or os.getenv("WSL_DISTRO_NAME") ~= nil
  end
end

-- -------------------------
-- General Settings
-- -------------------------
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
vim.opt.termguicolors = true
vim.opt.clipboard = "unnamedplus"
vim.opt.mouse = "a"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.undofile = true
vim.opt.wrap = false
vim.opt.cursorline = true
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- -------------------------
-- Platform-specific settings
-- -------------------------
if is_wsl then
  -- WSL: usar clip.exe e powershell.exe (nativos do Windows, sem instalar nada)
  vim.g.clipboard = {
    name = "WslClipboard",
    copy = {
      ["+"] = "clip.exe",
      ["*"] = "clip.exe",
    },
    paste = {
      ["+"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
      ["*"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
    },
    cache_enabled = 0,
  }
elseif is_windows then
  -- Windows nativo
  vim.opt.shell = "pwsh"
  vim.opt.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command"
  vim.opt.shellquote = ""
  vim.opt.shellxquote = ""

  -- Usar win32yank se disponível, senão PowerShell
  if vim.fn.executable("win32yank.exe") == 1 then
    vim.g.clipboard = {
      name = "win32yank",
      copy = {
        ["+"] = "win32yank.exe -i --crlf",
        ["*"] = "win32yank.exe -i --crlf",
      },
      paste = {
        ["+"] = "win32yank.exe -o --lf",
        ["*"] = "win32yank.exe -o --lf",
      },
      cache_enabled = 1,
    }
  else
    vim.g.clipboard = {
      name = "powershell",
      copy = {
        ["+"] = "powershell.exe -NoProfile -Command Set-Clipboard",
        ["*"] = "powershell.exe -NoProfile -Command Set-Clipboard",
      },
      paste = {
        ["+"] = 'powershell.exe -NoProfile -Command Get-Clipboard',
        ["*"] = 'powershell.exe -NoProfile -Command Get-Clipboard',
      },
      cache_enabled = 0,
    }
  end
elseif is_mac then
  -- macOS: usa pbcopy/pbpaste nativos (já funciona automaticamente)
  -- Configurar ASDF se disponível
  local asdf_dir = os.getenv("ASDF_DIR") or (os.getenv("HOME") .. "/.asdf")
  local asdf_shims = asdf_dir .. "/shims"

  if vim.fn.isdirectory(asdf_shims) == 1 then
    vim.env.ASDF_DIR = asdf_dir
    vim.env.PATH = asdf_shims .. ":" .. vim.env.PATH
  end
else
  -- Linux (não-WSL): tenta xclip, xsel ou wl-clipboard
  -- Mas também configura ASDF
  local asdf_dir = os.getenv("ASDF_DIR") or (os.getenv("HOME") .. "/.asdf")
  local asdf_shims = asdf_dir .. "/shims"

  if vim.fn.isdirectory(asdf_shims) == 1 then
    vim.env.ASDF_DIR = asdf_dir
    vim.env.PATH = asdf_shims .. ":" .. vim.env.PATH
  end
end

-- -------------------------
-- General Keymaps
-- -------------------------
local opts = { noremap = true, silent = true }

-- Git
vim.keymap.set('n', '<leader>gp', ':! git pull<CR>', { desc = "Git Pull" })
vim.keymap.set('n', '<leader>gd', ':DiffviewOpen<CR>', { desc = "Git Diff View" })
vim.keymap.set('n', '<leader>gc', ':DiffviewClose<CR>', { desc = "Close Diff View" })

-- Buffer navigation
vim.keymap.set('n', '<leader>bn', ':bnext<CR>', { desc = "Next Buffer" })
vim.keymap.set('n', '<leader>bp', ':bprevious<CR>', { desc = "Previous Buffer" })
vim.keymap.set('n', '<leader>bd', ':bdelete<CR>', { desc = "Delete Buffer" })
vim.keymap.set('n', '<leader>bl', ':buffers<CR>', { desc = "List Buffers" })

-- Window navigation
vim.keymap.set('n', '<C-h>', '<C-w>h', opts)
vim.keymap.set('n', '<C-j>', '<C-w>j', opts)
vim.keymap.set('n', '<C-k>', '<C-w>k', opts)
vim.keymap.set('n', '<C-l>', '<C-w>l', opts)

-- Window resize
vim.keymap.set('n', '<C-Up>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<C-Down>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', opts)

-- Quick save and quit
vim.keymap.set('n', '<leader>w', ':w<CR>', { desc = "Save" })
vim.keymap.set('n', '<leader>q', ':q<CR>', { desc = "Quit" })
vim.keymap.set('n', '<leader>Q', ':qa!<CR>', { desc = "Force Quit All" })

-- Clear search highlight
vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>', { desc = "Clear Highlight" })

-- Move lines
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = "Move Line Down" })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = "Move Line Up" })

-- Stay in visual mode when indenting
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

-- Better paste in visual mode
vim.keymap.set('v', 'p', '"_dP', opts)

-- Quick access to config
vim.keymap.set('n', '<leader>vc', ':e $MYVIMRC<CR>', { desc = "Edit Config" })
vim.keymap.set('n', '<leader>so', ':source $MYVIMRC<CR>', { desc = "Source Config" })

-- Auto-format on save (if LSP supports formatting)
vim.api.nvim_create_autocmd("BufWritePre", {
  group = vim.api.nvim_create_augroup("auto-format", { clear = true }),
  callback = function()
    local clients = vim.lsp.get_clients({ bufnr = vim.api.nvim_get_current_buf() })
    for _, client in ipairs(clients) do
      if client.supports_method("textDocument/formatting") then
        vim.lsp.buf.format({ async = false, timeout_ms = 2000 })
        return
      end
    end
  end,
})
