return {
  "rmagatti/auto-session",
  lazy = false,
  config = function()
    require("auto-session").setup({
      log_level = "error",
      auto_session_enable_last_session = false,
      auto_session_root_dir = vim.fn.stdpath("data") .. "/sessions/",
      auto_session_enabled = true,
      auto_save_enabled = true,
      auto_restore_enabled = true,
      auto_session_suppress_dirs = {
        "~/",
        "~/Downloads",
        "/",
      },
      auto_session_use_git_branch = true,
      bypass_save_filetypes = {
        "alpha",
        "dashboard",
        "neo-tree",
        "lazy",
        "mason",
        "notify",
        "noice",
        "trouble",
        "TelescopePrompt",
        "dapui_scopes",
        "dapui_breakpoints",
        "dapui_stacks",
        "dapui_watches",
        "dapui_console",
        "dap-repl",
      },
    })

    vim.keymap.set("n", "<leader>Ss", "<cmd>SessionSave<cr>", { desc = "Save Session" })
    vim.keymap.set("n", "<leader>Sr", "<cmd>SessionRestore<cr>", { desc = "Restore Session" })
    vim.keymap.set("n", "<leader>Sd", "<cmd>SessionDelete<cr>", { desc = "Delete Session" })
    vim.keymap.set("n", "<leader>Sf", "<cmd>Autosession search<cr>", { desc = "Find Session" })
    vim.keymap.set("n", "<leader>S", "<cmd>SessionSave<cr>", { desc = "Save Session" })
  end,
}
