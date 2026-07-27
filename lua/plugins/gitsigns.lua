return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("gitsigns").setup({
      signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
      },
      signcolumn = true,
      numhl = false,
      linehl = false,
      word_diff = false,
      watch_gitdir = {
        interval = 1000,
        follow_files = true,
      },
      attach_to_untracked = true,
      current_line_blame = false,
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol",
        delay = 1000,
        ignore_whitespace = false,
      },
      current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
      sign_priority = 6,
      update_debounce = 100,
      status_formatter = nil,
      max_file_length = 40000,
      preview_config = {
        border = "rounded",
        style = "minimal",
        relative = "cursor",
        row = 0,
        col = 1,
      },
    })

    local gs = package.loaded.gitsigns
    local opts = { noremap = true, silent = true }

    vim.keymap.set("n", "]h", gs.next_hunk, { desc = "Next Hunk" })
    vim.keymap.set("n", "[h", gs.prev_hunk, { desc = "Previous Hunk" })
    vim.keymap.set("n", "<leader>hs", gs.stage_hunk, { desc = "Stage Hunk" })
    vim.keymap.set("n", "<leader>hr", gs.reset_hunk, { desc = "Reset Hunk" })
    vim.keymap.set("v", "<leader>hs", function() gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, { desc = "Stage Hunk" })
    vim.keymap.set("v", "<leader>hr", function() gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, { desc = "Reset Hunk" })
    vim.keymap.set("n", "<leader>hS", gs.stage_buffer, { desc = "Stage Buffer" })
    vim.keymap.set("n", "<leader>hu", gs.undo_stage_hunk, { desc = "Undo Stage Hunk" })
    vim.keymap.set("n", "<leader>hR", gs.reset_buffer, { desc = "Reset Buffer" })
    vim.keymap.set("n", "<leader>hp", gs.preview_hunk, { desc = "Preview Hunk" })
    vim.keymap.set("n", "<leader>hb", function() gs.blame_line({ full = true }) end, { desc = "Blame Line" })
    vim.keymap.set("n", "<leader>tb", gs.toggle_current_line_blame, { desc = "Toggle Blame" })
    vim.keymap.set("n", "<leader>hd", gs.diffthis, { desc = "Diff This" })
    vim.keymap.set("n", "<leader>hD", function() gs.diffthis("~") end, { desc = "Diff This ~" })
    vim.keymap.set("n", "<leader>td", gs.toggle_deleted, { desc = "Toggle Deleted" })
  end,
}
