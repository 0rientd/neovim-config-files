return {
  "numToStr/FTerm.nvim",
  opts = {},
  config = function()
    vim.keymap.set('t', '<leader>ft', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')
    vim.keymap.set('n', '<leader>ft', '<CMD>lua require("FTerm").toggle()<CR>')
  end
}
