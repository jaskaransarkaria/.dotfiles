return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  dependencies = {
    { 'MaximilianLloyd/ascii.nvim', { 'MunifTanjim/nui.nvim' }, { 'nvim-tree/nvim-web-devicons' } },
  },
  config = function()
    require('dashboard').setup {
      config = {
        header = require('ascii').get_random_global(),
        -- header = require('ascii').art.text.neovim.sharp,
        shortcut = {
          {
            icon = ' ',
            desc = 'New',
            action = 'ene | startinsert',
            key = 'e',
          },
          {
            icon = '󰍉 ',
            desc = 'Find',
            action = 'Telescope find_files',
            key = 'f',
          },
          {
            icon = ' ',
            desc = 'Grep',
            action = 'Telescope live_grep',
            key = 'g',
          },
          {
            icon = ' ',
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
        footer = { '🚀 Sharp tools make good work.' },
      },
    }
  end,
}
