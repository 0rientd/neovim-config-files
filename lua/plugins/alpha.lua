return {
  "goolord/alpha-nvim",
  requires = { "kyazdani42/nvim-web-devicons" },
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    local function footer()
      return {
        os.date(" %d/%m/%Y   %H:%M"),
      }
    end

    local logo = {
      "⠀⠀⠀⠀⣠⣶⡾⠏⠉⠙⠳⢦⡀⠀⠀⠀⢠⠞⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠙⠲⡀⠀",
      "⠀⠀⠀⣴⠿⠏⠀⠀⠀⠀⠀⠀⢳⡀ ⠀⡏⠀⠀              ⠀⠀⢷",
      "⠀⠀⢠⣟⣋⡀⢀⣀⣀⡀⠀⣀⡀⣧⠀⢸⠀⠀⠀            ⠀⠀   ⡇",
      "⠀⠀⢸⣯⡭⠁⠸⣛⣟⠆⡴⣻⡲⣿⠀⣸⠀⠀Já treinou hoje?⠀ ⡇",
      "⠀⠀⣟⣿⡭⠀⠀⠀⠀⠀⢱⠀⠀⣿⠀⢹⠀⠀⠀⠀⠀               ⡇",
      "⠀⠀⠙⢿⣯⠄⠀⠀⠀⢀⡀⠀⠀⡿⠀⠀⡇⠀⠀⠀⠀              ⡼",
      "⠀⠀⠀⠀⠹⣶⠆⠀⠀⠀⠀⠀⡴⠃⠀⠀⠘⠤⣄⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⠞⠀",
      "⠀⠀⠀⠀⠀⢸⣷⡦⢤⡤⢤⣞⣁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
      "⠀⠀⢀⣤⣴⣿⣏⠁⠀⠀⠸⣏⢯⣷⣖⣦⡀⠀⠀⠀⠀⠀⠀",
      "⢀⣾⣽⣿⣿⣿⣿⠛⢲⣶⣾⢉⡷⣿⣿⠵⣿⠀⠀⠀⠀⠀⠀",
      "⣼⣿⠍⠉⣿⡭⠉⠙⢺⣇⣼⡏⠀⠀⠀⣄⢸⠀⠀⠀⠀⠀⠀",
      "⣿⣿⣧⣀⣿.........⣀⣰⣏⣘⣆⣀⠀⠀ ",
    }

    dashboard.section.header.val = logo
    dashboard.section.header.opts.hl = "Keyword"

    dashboard.section.buttons.val = {
      dashboard.button("<leader>ft", "👨‍💻 Open Terminal", "<CMD>lua require('FTerm').toggle()<CR>"),
      dashboard.button("<Ctrl>p", "🔭 Telescope"),
      dashboard.button("<Ctrl>n", "📂 Open Neo-tree"),
      dashboard.button("U", "🆙 Update Plugins", ":Lazy sync<CR>"),
      dashboard.button("M", "🔎 Open Mason", ":Mason<CR>"),
      dashboard.button("q", "🏃‍♀️ Quit", ":qa<cr>"),
    }

    dashboard.section.footer.val = footer()
    dashboard.section.footer.opts.hl = "Constant"

    alpha.setup(dashboard.opts)

    vim.cmd([[ autocmd FileType alpha setlocal nofoldenable ]])
  end,
}
