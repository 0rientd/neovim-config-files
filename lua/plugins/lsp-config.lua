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
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
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

        handlers = {
          -- Handler padrão (exceto Ruby)
          function(server)
            require("lspconfig")[server].setup({})
          end,

          -- Lua com config especial
          lua_ls = function()
            require("lspconfig").lua_ls.setup({
              settings = {
                Lua = {
                  diagnostics = {
                    globals = { "vim" }
                  }
                }
              }
            })
          end,
        }
      })
    end
  },

  -- -------------------------
  -- LSPConfig manual
  -- -------------------------
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      local util = require("lspconfig.util")

      -- Keymaps globais
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})

      lspconfig.ruby_lsp.setup({
        cmd = { "bundle", "exec", "ruby-lsp" },
        filetypes = { "ruby" },
        root_dir = util.root_pattern(
          "Gemfile",
          ".tool-versions",
          ".ruby-version"
        ),
      })
    end
  }
}
