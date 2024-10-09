return {
  {
    'lukas-reineke/indent-blankline.nvim',
    -- See `:help ibl`
    main = 'ibl',

    config = { exclude = { filetypes = { 'Dashboard', '', 'dashboard' }, buftypes = { 'nofile' } } },

    opts = {},
  },
}
