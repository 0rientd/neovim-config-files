return {
  "github/copilot.vim",
  event = "InsertEnter",
  config = function()
    -- Verificar se Node.js está disponível
    if vim.fn.executable("node") ~= 1 then
      vim.notify("GitHub Copilot: Node.js não encontrado. Instale Node.js para usar o Copilot.", vim.log.levels.WARN)
      vim.g.copilot_enabled = false
      return
    end

    -- Configurações do Copilot
    vim.g.copilot_no_tab_map = false
    vim.g.copilot_assume_mapped = true

    -- Keymaps do Copilot
    vim.keymap.set('i', '<C-J>', 'copilot#Accept("\\<CR>")', {
      expr = true,
      replace_keycodes = false,
      desc = "Copilot Accept"
    })

    -- Highlight para sugestões
    vim.api.nvim_create_autocmd("ColorScheme", {
      pattern = "*",
      callback = function()
        vim.api.nvim_set_hl(0, "CopilotSuggestion", {
          fg = "#555555",
          ctermfg = 8,
          italic = true,
        })
      end,
    })
  end,
}
