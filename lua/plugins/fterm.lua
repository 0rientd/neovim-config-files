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

    -- Configura highlights para remover fundo preto e manter bordas
    vim.api.nvim_create_autocmd("ColorScheme", {
      pattern = "*",
      callback = function()
        -- Fundo da floating window igual ao Normal
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
        -- Borda verde
        vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#98c379", bg = "none" })
      end,
    })

    -- Aplicar imediatamente também
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#98c379", bg = "none" })
  end
}
