return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "hrsh7th/nvim-cmp",
    "nvim-telescope/telescope.nvim",
    "stevearc/dressing.nvim",
    "MeanderingProgrammer/render-markdown.nvim",
  },
  config = function()
    require("codecompanion").setup({
      adapters = {
        lmstudio = function()
          return require("codecompanion.adapters").extend("openai", {
            name = "lmstudio",
            url = "http://localhost:1234/v1/chat/completions",
            env = {
              api_key = "lm-studio", -- LM Studio não valida a chave, qualquer valor funciona
            },
            schema = {
              model = {
                default = "local-model",
              },
            },
          })
        end,
      },
      strategies = {
        chat = {
          adapter = "lmstudio",
          roles = {
            llm = "Assistant",
            user = "Me",
          },
          keymaps = {
            close = {
              modes = { n = "q", i = "<C-c>" },
              index = 3,
              callback = "keymaps.close",
              description = "Close Chat",
            },
          },
        },
        inline = {
          adapter = "lmstudio",
          keymaps = {
            accept_change = {
              modes = { n = "ga" },
              index = 1,
              callback = "keymaps.accept_change",
              description = "Accept Change",
            },
            reject_change = {
              modes = { n = "gr" },
              index = 2,
              callback = "keymaps.reject_change",
              description = "Reject Change",
            },
          },
        },
        agent = {
          adapter = "lmstudio",
        },
      },
      display = {
        chat = {
          window = {
            layout = "vertical",
            position = "right",
            width = 0.35,
            border = "rounded",
          },
          intro_message = "Bem-vindo ao CodeCompanion! Modelo local via LM Studio.",
        },
        diff = {
          enabled = true,
          layout = "vertical",
          opts = {
            wrap = true,
          },
        },
      },
      opts = {
        log_level = "ERROR",
        send_code = true,
        use_default_actions = true,
        use_default_prompts = true,
      },
    })
  end,
  keys = {
    { "<leader>aa", "<cmd>CodeCompanionChat Toggle<cr>", desc = "Toggle AI Chat" },
    { "<leader>ai", "<cmd>CodeCompanion<cr>", desc = "AI Inline" },
    { "<leader>aq", "<cmd>CodeCompanionActions<cr>", desc = "AI Quick Actions" },
    { "<leader>ac", "<cmd>CodeCompanionChat Add<cr>", mode = "v", desc = "Add to Chat" },
  },
}
