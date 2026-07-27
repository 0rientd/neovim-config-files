return {
  "OXY2DEV/markview.nvim",
  ft = "markdown",
  keys = {
    { '<leader>md', '<cmd>Markview toggle<CR>', desc = "Toggle Markdown Preview" },
  },
  config = function()
    require("markview").setup({})
  end,
}
