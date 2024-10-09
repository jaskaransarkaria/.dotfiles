return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('lualine').setup {
      options = {
        icons_enabled = true,
        theme = 'palenight',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = true,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        },
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = {},
        lualine_x = { 'fileformat', 'filetype' },
        lualine_y = { 'progress', 'searchcount' },
        lualine_z = { 'location' },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {
        lualine_a = { { 'buffers', symbols = { unnamed = 'Empty Buffer' } } },
      },
      winbar = {},
      inactive_winbar = {},
      extensions = {
        'fugitive',
        'fzf',
        'lazy',
        'man',
        'mason',
        'nvim-dap-ui',
        'nvim-tree',
        'quickfix',
        'symbols-outline',
        'trouble',
      },
    }

    -- only show status on current pane
    vim.opt.laststatus = 3
    vim.opt.showcmd = false
  end,
}
