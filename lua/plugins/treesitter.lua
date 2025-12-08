return {
  "nvim-treesitter/nvim-treesitter", 
  branch = 'master', 
  lazy = false, 
  build = ":TSUpdate",
  config = function()
    -- Treesitter
    local config = require("nvim-treesitter.configs")
    config.setup({
      ensure_installed = { "javascript", "ruby", "html", "vim", "markdown", "query", "css", "json", "typescript", "yaml", "tsx", "gitignore", "dockerfile", "diff", "c", "bash", },
      highlight = { enable = true },
      indent = { enable = true },
    })
  end
}
