return {
  -- -------------------------
  -- Mason - Package Manager for LSP/DAP/Linters
  -- -------------------------
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    config = function()
      require("mason").setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
          },
          border = "rounded",
        },
        log_level = vim.log.levels.WARN,
      })
    end,
  },

  -- -------------------------
  -- Mason LSP Config
  -- -------------------------
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
    },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
        },
        automatic_installation = true,
      })
    end,
  },

  -- -------------------------
  -- LSP Configuration (Neovim 0.11+ native API)
  -- -------------------------
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      -- nvim-cmp capabilities
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- Diagnostic configuration
      vim.diagnostic.config({
        virtual_text = {
          prefix = "●",
          source = "if_many",
        },
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = " ",
            [vim.diagnostic.severity.WARN] = " ",
            [vim.diagnostic.severity.HINT] = "󰌵 ",
            [vim.diagnostic.severity.INFO] = " ",
          },
        },
        underline = true,
        update_in_insert = false,
        severity_sort = true,
        float = {
          border = "rounded",
          source = true,
        },
      })

      -- -------------------------
      -- LSP Keymaps (on attach)
      -- -------------------------
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("user-lsp-attach", { clear = true }),
        callback = function(event)
          local bufnr = event.buf
          local client = vim.lsp.get_client_by_id(event.data.client_id)

          local map = function(keys, func, desc)
            vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
          end

          -- Navigation
          map("K", vim.lsp.buf.hover, "Hover Documentation")
          map("gD", vim.lsp.buf.declaration, "Go to Declaration")
          map("gd", vim.lsp.buf.definition, "Go to Definition")
          map("gi", vim.lsp.buf.implementation, "Go to Implementation")
          map("gr", vim.lsp.buf.references, "Find References")
          map("<leader>D", vim.lsp.buf.type_definition, "Type Definition")

          -- Actions
          map("<leader>rn", vim.lsp.buf.rename, "Rename Symbol")
          map("<leader>ca", vim.lsp.buf.code_action, "Code Action")
          map("<leader>ds", vim.lsp.buf.document_symbol, "Document Symbols")
          map("<leader>ws", vim.lsp.buf.workspace_symbol, "Workspace Symbols")

          -- Diagnostics
          map("<leader>e", vim.diagnostic.open_float, "Show Diagnostic")
          map("[d", function() vim.diagnostic.jump({ count = -1 }) end, "Previous Diagnostic")
          map("]d", function() vim.diagnostic.jump({ count = 1 }) end, "Next Diagnostic")
          map("<leader>dl", vim.diagnostic.setloclist, "Diagnostic List")
        end,
      })

      -- -------------------------
      -- LSP Server Configurations (vim.lsp.config API)
      -- -------------------------

      -- Lua Language Server
      vim.lsp.config.lua_ls = {
        cmd = { "lua-language-server" },
        filetypes = { "lua" },
        root_markers = { ".luarc.json", ".luarc.jsonc", ".luacheckrc", ".stylua.toml", "stylua.toml", "selene.toml", "selene.yml", ".git" },
        capabilities = capabilities,
        settings = {
          Lua = {
            runtime = { version = "LuaJIT" },
            diagnostics = { globals = { "vim" } },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
              checkThirdParty = false,
            },
            telemetry = { enable = false },
          },
        },
      }

      -- Ruby LSP
      vim.lsp.config.ruby_lsp = {
        cmd = { "ruby-lsp" },
        filetypes = { "ruby", "eruby" },
        root_markers = { "Gemfile", ".ruby-version", ".ruby-gemset", ".git" },
        capabilities = capabilities,
      }

      -- TypeScript/JavaScript
      vim.lsp.config.ts_ls = {
        cmd = { "typescript-language-server", "--stdio" },
        filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
        root_markers = { "tsconfig.json", "jsconfig.json", "package.json", ".git" },
        capabilities = capabilities,
      }

      -- Python
      vim.lsp.config.pylsp = {
        cmd = { "pylsp" },
        filetypes = { "python" },
        root_markers = { "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", "Pipfile", ".git" },
        capabilities = capabilities,
      }

      -- JSON
      vim.lsp.config.jsonls = {
        cmd = { "vscode-json-language-server", "--stdio" },
        filetypes = { "json", "jsonc" },
        root_markers = { ".git" },
        capabilities = capabilities,
      }

      -- HTML
      vim.lsp.config.html = {
        cmd = { "vscode-html-language-server", "--stdio" },
        filetypes = { "html", "templ" },
        root_markers = { ".git" },
        capabilities = capabilities,
      }

      -- CSS
      vim.lsp.config.cssls = {
        cmd = { "vscode-css-language-server", "--stdio" },
        filetypes = { "css", "scss", "less" },
        root_markers = { ".git" },
        capabilities = capabilities,
      }

      -- YAML
      vim.lsp.config.yamlls = {
        cmd = { "yaml-language-server", "--stdio" },
        filetypes = { "yaml", "yaml.docker-compose", "yaml.gitlab" },
        root_markers = { ".git" },
        capabilities = capabilities,
      }

      -- Docker
      vim.lsp.config.dockerls = {
        cmd = { "docker-langserver", "--stdio" },
        filetypes = { "dockerfile" },
        root_markers = { "Dockerfile", ".git" },
        capabilities = capabilities,
      }

      -- C/C++ (clangd)
      vim.lsp.config.clangd = {
        cmd = { "clangd", "--background-index", "--clang-tidy", "--header-insertion=iwyu", "--completion-style=bundled", "--cross-file-rename" },
        filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
        root_markers = { ".clangd", ".clang-tidy", ".clang-format", "compile_commands.json", "compile_flags.txt", "configure.ac", ".git" },
        capabilities = capabilities,
      }

      -- -------------------------
      -- Enable LSP servers
      -- -------------------------
      vim.lsp.enable({
        "lua_ls",
        "ruby_lsp",
        "ts_ls",
        "pylsp",
        "jsonls",
        "html",
        "cssls",
        "yamlls",
        "dockerls",
        "clangd",
      })
    end,
  }
}
