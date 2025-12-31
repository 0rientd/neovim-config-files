return {
  "folke/twilight.nvim",
  opts = {},
  config = function()
    -- Keymap manual
    vim.keymap.set("n", "<leader>tw", "<cmd>Twilight<CR>", { desc = "Toggle Twilight" })

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
