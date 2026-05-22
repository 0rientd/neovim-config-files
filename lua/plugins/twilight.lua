return {
  "folke/twilight.nvim",
  cmd = { "Twilight", "TwilightEnable", "TwilightDisable" },
  keys = {
    { '<leader>tw', '<cmd>Twilight<CR>', desc = "Toggle Twilight" },
  },
  config = function()
    require("twilight").setup({
      dimming = {
        alpha = 0.25,
      },
      context = 10,
      treesitter = true,
    })

    -- Auto enable in insert mode
    local group = vim.api.nvim_create_augroup("TwilightInsertMode", { clear = true })

    vim.api.nvim_create_autocmd("InsertEnter", {
      group = group,
      callback = function()
        vim.cmd("TwilightEnable")
      end,
    })

    vim.api.nvim_create_autocmd("InsertLeave", {
      group = group,
      callback = function()
        vim.cmd("TwilightDisable")
      end,
    })
  end
}
