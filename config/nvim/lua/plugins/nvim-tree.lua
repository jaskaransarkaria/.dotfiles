-- Nvim-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-tree/nvim-tree.lua

vim.keymap.set('n', '<leader>e', ':NvimTreeFindFileToggle<CR>', { desc = 'Toggle File Explorer' })

return {
  'nvim-tree/nvim-tree.lua',
  version = '*',
  lazy = false,
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  setup = {
    update_focused_file = {
      enable = true,
    },
  },
  config = function()
    require('nvim-tree').setup {
      sort = {
        sorter = 'case_sensitive',
      },
      view = {
        width = 30,
      },
      renderer = {
        group_empty = true,
      },
      filters = {
        dotfiles = false,
      },
    }
  end,
}
