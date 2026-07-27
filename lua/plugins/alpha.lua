return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local frases = {
      "Bug ou feature?!",
      "Hello world bug!",
      "Cafe e codigo!!!",
      "Funciona aqui???",
      "Codar ou dormir?",
      "Git deu ruim  :(",
      "Debug sem cafe!!",
      "if cafe then end",
      "Linux e amor  <3",
      "Stack overflow!!",
      "Push sexta??????",
      "Ja treinou hoje?",
      "Shift happens :)",
      "Kernel panic!!!!",
      "Backend feliz :)",
      "Deploy na fe  :)",
      "Bug virou lore!!",
    }

    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    math.randomseed(os.time())

    local function frase_random()
      local randomIndex = math.random(#frases)
      return frases[randomIndex]
    end

    local function footer()
      return {
        os.date(" %d/%m/%Y   %H:%M"),
      }
    end

		local logo = {
			"⠀⠀⠀⠀⣠⣶⡾⠏⠉⠙⠳⢦⡀⠀⠀⠀⢠⠞⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠙⠲⡀⠀",
			"⠀⠀⠀⣴⠿⠏⠀⠀⠀⠀⠀⠀⢳⡀ ⠀⡏⠀⠀              ⠀⠀⢷",
			"⠀⠀⢠⣟⣋⡀⢀⣀⣀⡀⠀⣀⡀⣧⠀⢸⠀⠀⠀            ⠀⠀   ⡇",
			"⠀⠀⢸⣯⡭⠁⠸⣛⣟⠆⡴⣻⡲⣿⠀⣸⠀⠀" .. frase_random() .. "⠀ ⡇",
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
      dashboard.button("f", "🔍  Find file", ":Telescope find_files<CR>"),
      dashboard.button("r", "⏰  Recent files", ":Telescope oldfiles<CR>"),
      dashboard.button("g", "🔎  Find word", ":Telescope live_grep<CR>"),
      dashboard.button("n", "📂  File explorer", ":Neotree toggle<CR>"),
      dashboard.button("t", "💻  Terminal", '<CMD>lua require("FTerm").toggle()<CR>'),
      dashboard.button("c", "⚙️   Config", ":e $MYVIMRC<CR>"),
      dashboard.button("u", "🔄  Update plugins", ":Lazy sync<CR>"),
      dashboard.button("m", "🔧  Mason (LSP)", ":Mason<CR>"),
      dashboard.button("k", "⌨️   Keymaps", ":Telescope keymaps<CR>"),
      dashboard.button("q", "👋  Quit", ":qa<CR>"),
    }

    dashboard.section.footer.val = footer()
    dashboard.section.footer.opts.hl = "Constant"

    alpha.setup(dashboard.opts)

    vim.cmd([[ autocmd FileType alpha setlocal nofoldenable ]])
  end,
}
