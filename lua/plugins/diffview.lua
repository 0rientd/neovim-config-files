return {
  "sindrets/diffview.nvim",
  cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewFileHistory" },
  config = function()
    require("diffview").setup({})
    vim.keymap.set("n", "<leader>gh", ':DiffviewFileHistory<CR>', { desc = "Git File History" })
  end
}
