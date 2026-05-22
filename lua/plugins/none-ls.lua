return {
  "nvimtools/none-ls.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local null_ls = require("null-ls")
    local formatting = null_ls.builtins.formatting
    local diagnostics = null_ls.builtins.diagnostics

    -- Build sources list dynamically based on available tools
    local sources = {}

    -- Lua formatting
    if vim.fn.executable("stylua") == 1 then
      table.insert(sources, formatting.stylua)
    end

    -- JavaScript/TypeScript
    if vim.fn.executable("prettier") == 1 then
      table.insert(sources, formatting.prettier.with({
        filetypes = {
          "javascript", "javascriptreact",
          "typescript", "typescriptreact",
          "vue", "css", "scss", "less",
          "html", "json", "jsonc", "yaml",
          "markdown", "graphql",
        },
      }))
    end

    if vim.fn.executable("eslint_d") == 1 then
      table.insert(sources, diagnostics.eslint_d)
    elseif vim.fn.executable("eslint") == 1 then
      table.insert(sources, diagnostics.eslint)
    end

    -- Ruby (só ativar se houver configuração do RuboCop)
    if vim.fn.executable("rubocop") == 1 then
      -- Verifica se há arquivo de configuração
      local has_rubocop_config = vim.fn.filereadable(".rubocop.yml") == 1
        or vim.fn.filereadable(".rubocop_todo.yml") == 1

      if has_rubocop_config then
        table.insert(sources, formatting.rubocop)
        table.insert(sources, diagnostics.rubocop)
      end
    end

    -- Python
    if vim.fn.executable("black") == 1 then
      table.insert(sources, formatting.black)
    end

    if vim.fn.executable("isort") == 1 then
      table.insert(sources, formatting.isort)
    end

    -- Only setup if we have sources
    if #sources > 0 then
      null_ls.setup({
        sources = sources,
        -- Don't show messages on startup
        on_init = function(new_client, _)
          new_client.offset_encoding = "utf-32"
        end,
      })
    end

    -- Format keymap
    vim.keymap.set("n", "<leader>gf", function()
      vim.lsp.buf.format({ async = true })
    end, { desc = "Format Buffer" })
  end,
}
