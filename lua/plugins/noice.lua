return {
  -- nvim-notify (configurado antes do noice)
  {
    "rcarriga/nvim-notify",
    lazy = false,
    priority = 100,
    config = function()
      require("notify").setup({
        background_colour = "#000000",
        fps = 30,
        icons = {
          DEBUG = "",
          ERROR = "",
          INFO = "",
          TRACE = "✎",
          WARN = ""
        },
        level = 2,
        minimum_width = 50,
        render = "wrapped-compact",
        stages = "fade_in_slide_out",
        time_formats = {
          notification = "%T",
          notification_history = "%FT%T"
        },
        timeout = 3000,
        top_down = true
      })
      vim.notify = require("notify")
    end,
  },

  -- Noice UI
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    opts = {
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
        inc_rename = false,
        lsp_doc_border = true,
      },
    },
  },
}
