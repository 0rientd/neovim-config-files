return {
  "numToStr/FTerm.nvim",
  keys = {
    { '<leader>ft', '<CMD>lua require("FTerm").toggle()<CR>', mode = 'n', desc = "Toggle Terminal" },
    { '<leader>ft', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', mode = 't', desc = "Toggle Terminal" },
    { '<Esc>', '<C-\\><C-n>', mode = 't', desc = "Exit Terminal Mode" },
  },
  config = function()
    require("FTerm").setup({
      border = "rounded",
      blend = 0,
      dimensions = {
        height = 0.8,
        width = 0.8,
      },
    })

    -- Configura highlights dinâmicos baseados no tema atual
    local function set_term_highlights()
      local ok, hl = pcall(vim.api.nvim_get_hl, 0, { name = "String" })
      local fg = (ok and hl.fg) and string.format("#%06x", hl.fg) or "#98c379"
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
      vim.api.nvim_set_hl(0, "FloatBorder", { fg = fg, bg = "none" })
    end

    vim.api.nvim_create_autocmd("ColorScheme", {
      pattern = "*",
      callback = set_term_highlights,
    })

    set_term_highlights()
  end
}
