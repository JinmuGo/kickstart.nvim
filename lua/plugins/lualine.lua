return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local icons = require('utils.icons').icons

    local config = {
      options = {
        component_separators = '',
        section_separators = { left = icons.lualine.seperator_right, right = icons.lualine.filetype_seperator_left },
        theme = 'catppuccin',
        disabled_filetypes = {
          statusline = { 'lazy', 'alpha' },
          winbar = { 'lazy', 'alpha' },
        },
      },
      sections = {
        lualine_a = {
          { 'mode', separator = { left = icons.lualine.seperator_left, right = icons.lualine.seperator_right } },
        },
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        lualine_c = {},
        lualine_x = {},
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        lualine_c = {},
        lualine_x = {},
      },
    }

    local function insert_left(component)
      table.insert(config.sections.lualine_c, component)
    end

    local function insert_right(component)
      table.insert(config.sections.lualine_x, component)
    end

    insert_left {
      'branch',
      icon = icons.lualine.branch,
      color = { fg = '#ebdbb2', gui = 'bold' },
    }

    insert_left {
      'diff',
      symbols = { added = icons.lualine.added, modified = icons.lualine.modified, removed = icons.lualine.removed },
    }

    insert_left {
      'diagnostics',
      sources = { 'nvim_diagnostic' },
      symbols = { error = icons.lualine.error, warn = icons.lualine.warn, info = icons.lualine.info },
    }

    insert_left {
      function()
        return '%='
      end,
    }

    insert_right { 'location' }

    insert_right {
      require('lazy.status').updates,
      cond = require('lazy.status').has_updates,
    }

    insert_right {
      function()
        return icons.lualine.filetype_seperator_left
      end,
      color = { fg = '#ea6962' },
      padding = { right = 0 },
    }
    insert_right { 'filetype', color = { fg = 'black', bg = '#ea6962', gui = 'bold' } }
    insert_right {
      function()
        return icons.lualine.filetype_seperator_right
      end,
      color = { fg = '#ea6962' },
      padding = { left = 0 },
    }

    -- Theme customization
    local auto = require 'lualine.themes.auto'
    local lualine_modes = { 'insert', 'normal', 'visual', 'command', 'replace', 'inactive', 'terminal' }
    for _, field in ipairs(lualine_modes) do
      if auto[field] and auto[field].c then
        auto[field].c.bg = '#292929'
      end
    end
    config.options.theme = auto

    require('lualine').setup(config)
  end,
}
