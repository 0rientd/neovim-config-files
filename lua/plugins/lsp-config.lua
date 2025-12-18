return {
  -- -------------------------
  -- Mason
  -- -------------------------
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },

  -- -------------------------
  -- Mason LSP Config
  -- -------------------------
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "neovim/nvim-lspconfig" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "ts_ls",
          "cssls",
          "dockerls",
          "html",
          "jsonls",
          "pylsp",
          "tailwindcss",
          "terraformls",
          "yamlls"
        },
        automatic_installation = true,
      })
    end
  },

  -- -------------------------
  -- LSPConfig
  -- -------------------------
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require('lspconfig')
      local on_attach = function(client, bufnr)
        local bufmap = function(keys, func)
          vim.keymap.set('n', keys, func, { buffer = bufnr })
        end

        bufmap('K', vim.lsp.buf.hover)
        bufmap('gD', vim.lsp.buf.declaration)
        bufmap('gd', vim.lsp.buf.definition)
        bufmap('gi', vim.lsp.buf.implementation)
        bufmap('gr', vim.lsp.buf.references)
        bufmap('<leader>rn', vim.lsp.buf.rename)
        bufmap('<leader>ca', vim.lsp.buf.code_action)
      end

      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('user-lsp-attach', { clear = true }),
        callback = function(event)
          on_attach(vim.lsp.get_client_by_id(event.data.client_id), event.buf)
        end,
      })

      -- Custom setup for lua_ls
      lspconfig.lua_ls.setup({
        settings = {
          Lua = {
            diagnostics = {
              globals = { 'vim' },
            },
          },
        },
      })

      -- Manual LSP config
      lspconfig.ruby_lsp.setup({
        cmd = { "bundle", "exec", "ruby-lsp" },
        filetypes = { "ruby" },
        root_dir = vim.fs.root(0, {
          "Gemfile",
          ".tool-versions",
          ".ruby-version"
        }),
      })
    end
  }
}
