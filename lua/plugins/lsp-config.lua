return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },

  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "ts_ls",
          "ruby_lsp",
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
          -- Handler padrão para todos os LSPs
          function(server)
            require("lspconfig")[server].setup({})
          end,

          -- Configuração especial para o Lua
          lua_ls = function()
            require("lspconfig").lua_ls.setup({
              settings = {
                Lua = {
                  diagnostics = { globals = { "vim" } }
                }
              }
            })
          end,

          -- ⭐ CONFIGURAÇÃO CRÍTICA: ruby-lsp com asdf
          ruby_lsp = function()
            require("lspconfig").ruby_lsp.setup({
              cmd = { "asdf", "exec", "ruby", "-S", "ruby-lsp" },
            })
          end,
        }
      })
    end
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
    end
  }
}
