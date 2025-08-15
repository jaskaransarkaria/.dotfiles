-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

--fix terraform and hcl comment string
vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('FixTerraformCommentString', { clear = true }),
  callback = function(ev)
    vim.bo[ev.buf].commentstring = '# %s'
  end,
  pattern = { 'terraform', 'hcl' },
})

vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = { '*.yaml', '*.yml' },
  callback = function(ev)
    if vim.fn.search('# yaml-language-server: $schema=', 'nw') > 0 then
      local modeline = vim.fn.getline(1)
      vim.fn.setreg('z', modeline)
      vim.fn.deletebufline(ev.buf, 1, 1)
    end
  end,
})

vim.api.nvim_create_autocmd('BufWritePost', {
  pattern = { '*.yaml', '*.yml' },
  callback = function()
    local str_modeline = vim.fn.getreg 'z'
    if string.find(str_modeline, '# yaml%-language%-server: %$schema=') then
      local remove_newline = string.gsub(str_modeline, '[\n\r]', '')

      vim.api.nvim_buf_set_lines(0, 0, 0, false, { remove_newline })
      vim.fn.setreg('z', '')
    end
  end,
})
-- vim: ts=2 sts=2 sw=2 et
