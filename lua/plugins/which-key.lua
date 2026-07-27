return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  config = function()
    local wk = require("which-key")
    wk.setup({
      preset = "modern",
      delay = 200,
    })

    -- Register key groups
    wk.add({
      { "<leader>f", group = "Find/Files" },
      { "<leader>g", group = "Git" },
      { "<leader>b", group = "Buffers" },
      { "<leader>l", group = "LSP" },
      { "<leader>t", group = "Toggle/Tools" },
      { "<leader>c", group = "Code/CMake" },
      { "<leader>d", group = "Debug" },
      { "<leader>x", group = "Diagnostics/Trouble" },
      { "<leader>m", group = "Markdown" },
      { "<leader>v", group = "Vim/Config" },
      { "<leader>w", group = "Window", proxy = "<C-w>" },
      { "<leader>a", group = "AI" },
      { "<leader>h", group = "Hunk/Git" },
      { "<leader>S", group = "Session" },
    })
  end,
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps",
    },
    {
      "<leader>k",
      function()
        require("which-key").show()
      end,
      desc = "Show All Keymaps",
    },
  },
}
