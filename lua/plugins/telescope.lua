return {
  {
    'nvim-telescope/telescope.nvim', tag = 'v0.1.9',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-ui-select.nvim',
    },
    cmd = "Telescope",
    keys = {
      { '<C-p>', '<cmd>Telescope find_files<CR>', desc = "Find Files" },
      { '<leader>ff', '<cmd>Telescope find_files<CR>', desc = "Find Files" },
      { '<leader>fg', '<cmd>Telescope live_grep<CR>', desc = "Live Grep" },
      { '<leader>fb', '<cmd>Telescope buffers<CR>', desc = "Buffers" },
      { '<leader>fh', '<cmd>Telescope help_tags<CR>', desc = "Help Tags" },
      { '<leader>fo', '<cmd>Telescope oldfiles<CR>', desc = "Recent Files" },
      { '<leader>fc', '<cmd>Telescope commands<CR>', desc = "Commands" },
      { '<leader>fk', '<cmd>Telescope keymaps<CR>', desc = "Keymaps" },
      { '<leader>fr', '<cmd>Telescope registers<CR>', desc = "Registers" },
      { '<leader>fs', '<cmd>Telescope lsp_document_symbols<CR>', desc = "Document Symbols" },
      { '<leader>td', '<cmd>Telescope diagnostics<CR>', desc = "Diagnostics" },
      { '<leader>gc', '<cmd>Telescope git_commits<CR>', desc = "Git Commits" },
      { '<leader>gs', '<cmd>Telescope git_status<CR>', desc = "Git Status" },
      { '<leader>gb', '<cmd>Telescope git_branches<CR>', desc = "Git Branches" },
    },
    config = function()
      local telescope = require("telescope")
      local actions = require("telescope.actions")

      telescope.setup({
        defaults = {
          prompt_prefix = "   ",
          selection_caret = "  ",
          entry_prefix = "  ",
          path_display = { "truncate" },
          sorting_strategy = "ascending",
          layout_strategy = "horizontal",
          layout_config = {
            horizontal = {
              prompt_position = "top",
              preview_width = 0.55,
              results_width = 0.8,
            },
            vertical = {
              mirror = false,
            },
            width = 0.87,
            height = 0.80,
            preview_cutoff = 120,
          },
          -- Bordas arredondadas
          borderchars = {
            prompt = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
            results = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
            preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
          },
          -- Visual mais limpo
          winblend = 0,
          color_devicons = true,
          set_env = { ["COLORTERM"] = "truecolor" },
          file_ignore_patterns = { "node_modules", ".git/", "%.lock" },
          mappings = {
            i = {
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,
              ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
              ["<Esc>"] = actions.close,
            },
          },
        },
        pickers = {
          find_files = {
            hidden = true,
            previewer = true,
          },
          live_grep = {
            additional_args = function()
              return { "--hidden" }
            end,
          },
        },
      })

      telescope.load_extension("ui-select")
    end,
  }
}
