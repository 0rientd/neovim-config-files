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
            vim.lsp.config(server, {})
          end,

          -- Lua com config especial
          lua_ls = function()
            vim.lsp.config("lua_ls", {
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
  -- LSPConfig manual (Ruby)
  -- -------------------------
  {
    "neovim/nvim-lspconfig",
    config = function()
      -- Keymaps globais 
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})

      vim.lsp.config("ruby_lsp", {
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
