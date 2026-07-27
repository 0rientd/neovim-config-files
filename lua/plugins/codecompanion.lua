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
    local adapters = require("codecompanion.adapters")

    require("codecompanion").setup({
      adapters = {
        http = {
          openwebui = function()
            local adapter = adapters.extend("openai", {
              name = "openwebui",
              formatted_name = "Local AI",

              env = {
                api_key = os.getenv("OPENWEBUI_API_KEY"),
              },

              schema = {
                model = {
                  default = "qwen2.5-coder-7b-instruct",
                },
              },
            })

            adapter.url = "http://192.168.0.11:8080/api/v1/chat/completions"

            return adapter
          end,
        },
      },

      strategies = {
        chat = {
          adapter = "openwebui",
        },

        inline = {
          adapter = "openwebui",
        },

        agent = {
          adapter = "openwebui",
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

          intro_message = "O que deseja fazer?",
        },

        diff = {
          enabled = true,
          layout = "vertical",
        },
      },

      opts = {
        log_level = "DEBUG",
        send_code = true,
        use_default_actions = true,
        use_default_prompts = true,
      },
    })
  end,

  keys = {
    {
      "<leader>aa",
      "<cmd>CodeCompanionChat Toggle<CR>",
      desc = "Toggle AI Chat",
    },

    {
      "<leader>ai",
      "<cmd>CodeCompanion<CR>",
      desc = "AI Inline",
    },

    {
      "<leader>aq",
      "<cmd>CodeCompanionActions<CR>",
      desc = "AI Quick Actions",
    },

    {
      "<leader>ac",
      "<cmd>CodeCompanionChat Add<CR>",
      mode = "v",
      desc = "Add to Chat",
    },
  },
}
