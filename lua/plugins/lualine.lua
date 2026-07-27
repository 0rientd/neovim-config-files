return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local function lsp_clients()
      local clients = vim.lsp.get_clients({ bufnr = vim.api.nvim_get_current_buf() })
      if #clients == 0 then
        return ""
      end
      local names = {}
      for _, client in ipairs(clients) do
        table.insert(names, client.name)
      end
      return " " .. table.concat(names, ", ")
    end

    local function diagnostics_count()
      local error = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
      local warn = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
      local info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
      local hint = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })

      local parts = {}
      if error > 0 then
        table.insert(parts, " " .. error)
      end
      if warn > 0 then
        table.insert(parts, " " .. warn)
      end
      if info > 0 then
        table.insert(parts, " " .. info)
      end
      if hint > 0 then
        table.insert(parts, " " .. hint)
      end

      return table.concat(parts, " ")
    end

    require('lualine').setup({
      options = {
        theme = 'yoda',
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        globalstatus = true,
      },
      sections = {
        lualine_a = {
          {
            'mode',
            fmt = function(str)
              return str:sub(1, 1)
            end,
          },
        },
        lualine_b = {
          {
            'branch',
            icon = '',
          },
          {
            'diff',
            symbols = { added = "+", modified = "~", removed = "-" },
          },
        },
        lualine_c = {
          {
            'filename',
            path = 1,
            symbols = {
              modified = "●",
              readonly = "",
              unnamed = "[No Name]",
              newfile = "[New]",
            },
          },
        },
        lualine_x = {
          {
            lsp_clients,
            icon = "",
          },
          {
            diagnostics_count,
          },
          {
            'filetype',
            icon_only = true,
          },
        },
        lualine_y = {
          {
            'progress',
            icon = "",
          },
        },
        lualine_z = {
          {
            'location',
            icon = "",
          },
        },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { { 'filename', path = 1 } },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = { 'neo-tree', 'lazy', 'mason', 'trouble', 'fugitive' },
    })
  end,
}
