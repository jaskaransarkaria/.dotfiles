local function find_all_vim_grep(opts)
  local vimgrepArgs = '/' .. opts.args .. '/' .. '`find . -path ./.git -prune -o -type f`'
  return vim.api.nvim_cmd({ cmd = 'vimgrep', args = { vimgrepArgs } }, { output = true })
end

vim.api.nvim_create_user_command(
  'FindAll',
  find_all_vim_grep,
  { nargs = 1, desc = 'use vimgrep to search for all occurrences of a pattern in a project, add these to a quickfix list' }
)
