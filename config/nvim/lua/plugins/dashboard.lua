return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  dependencies = {
    { 'MaximilianLloyd/ascii.nvim', { 'MunifTanjim/nui.nvim' }, { 'nvim-tree/nvim-web-devicons' }, { 'rubiin/fortune.nvim' } },
  },
  config = function()
    local rand = require('ascii').get_random_global()
    table.insert(rand, '')
    table.insert(rand, '')
    table.insert(rand, 'Jaskaran Sarkaria')
    table.insert(rand, '')
    require('dashboard').setup {
      shortcut_type = 'number',
      hide = {
        statusline = false,
        tabline = false,
      },
      week_header = {
        enable = true,
      },
      config = {
        header = rand,
        -- header = require('ascii').art.text.neovim.sharp,
        shortcut = {
          {
            icon = '📂 ',
            desc = 'New',
            action = 'ene | startinsert',
            key = 'e',
          },
          {
            icon = '🔎 ',
            desc = 'Find',
            action = 'Telescope find_files',
            key = 'f',
          },
          {
            icon = '🗂️ ',
            desc = 'Grep',
            action = 'Telescope live_grep',
            key = 'g',
          },
          {
            icon = '🌳 ',
            desc = 'Browse',
            action = 'NvimTreeFindFileToggle',
            key = 'e',
          },
          { icon = ' ', desc = 'Lazy', group = 'Label', action = 'Lazy check', key = 'l' },
          { desc = 'Quit', group = 'Number', action = 'q', key = 'q' },
        },
        mru = { limit = 10, icon = ' ', label = 'Recent files', cwd_only = true },
        project = {
          enable = true,
          limit = 5,
          icon = '󰹈 ',
          label = 'Recent Projects',
          action = 'Telescope find_files cwd=',
        },

        footer = function()
          local info = { '', '', '' }
          local fortune_lib = require 'fortune'
          fortune_lib.setup { content_type = 'mixed', display_format = 'mixed' }
          local fortune = fortune_lib.get_fortune()
          info[3] = '  Neovim loaded ' .. vim.fn.strftime '%H:%M' .. ' on ' .. vim.fn.strftime '%d/%m/%Y' .. " '"
          local footer = vim.list_extend(info, fortune)
          return footer
        end,
      },
    }
  end,
}
