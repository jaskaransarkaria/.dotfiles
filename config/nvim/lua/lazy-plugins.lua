require('lazy').setup {
  require 'plugins.onedark',
  require 'plugins.nvim-lsp',
  require 'plugins.telescope',
  require 'plugins.treesitter',
  require 'plugins.nvim-cmp',
  require 'plugins.conform',
  require 'plugins.mini',
  require 'plugins.which-key',
  require 'plugins.debug',
  require 'plugins.indent-line',
  require 'plugins.gitsigns',
  require 'plugins.autopairs',
  require 'plugins.nvim-tree',
  require 'plugins.lazydev',
  require 'plugins.luvit-meta',
  require 'plugins.tokyonight',
  require 'plugins.todo-comments',
  require 'plugins.lint',
  require 'plugins.bullets',
  require 'plugins.vim-sleuth',
  require 'plugins.go',

  -- NOTE: The import below can automatically add your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
  --    This is the easiest way to modularize your config.
  --
  --  Uncomment the following line and add your plugins to `lua/custom/plugins/*.lua` to get going.
  --    For additional information, see `:help lazy.nvim-lazy.nvim-structuring-your-plugins`
  -- { import = 'custom.plugins' },
  --   -- If you are using a Nerd Font: set icons to an empty table which will use the
  --   -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
  ui = {},
}

-- vim: ts=2 sts=2 sw=2 et
