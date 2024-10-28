local function find_all_vim_grep(opts)
  local vimgrepArgs = '/' .. opts.fargs[1] .. '/gj' .. '`find . -path ./.git -prune -o -type f`'
  return vim.api.nvim_cmd({ cmd = 'vimgrep', args = { vimgrepArgs } }, { output = false })
end

local function get_github_permalink()
  local current_line = vim.api.nvim__buf_stats(0).current_lnum
  local file_path = vim.fn.expand '%'

  local git_dir = vim.fn.finddir('.git', vim.fn.expand '%:p' .. ';', 1)
  -- TODO only find rel root if not in current cwd
  local rel_root = string.gsub(git_dir, '.*/(.*)/.git', '%1')

  local esc_rel_root = string.gsub(rel_root, '%-', '%%-')
  local rel_path = string.gsub(file_path, '.*/' .. esc_rel_root .. '/(.*)', '%1')
  local cd_proj_path = string.gsub(git_dir, '/.git', '')
  local remote_url = vim.fn.system('cd ' .. cd_proj_path .. '; git config --get remote.origin.url; cd -')
  local main_commit_hash = vim.fn.system('cd ' .. cd_proj_path .. '; git rev-list main --first-parent | head -n 1; cd -')

  local org_name = string.gsub(remote_url, 'git@github.com:(.*)/' .. esc_rel_root .. '.git', '%1')

  local permalink = 'https://github.com/' .. org_name .. '/' .. rel_root .. '/blob/' .. main_commit_hash .. '/' .. rel_path .. '#L' .. current_line
  -- if not (vim.fn.empty(gitDir)) then
  --   print '.git directory is found'
  --   vim.fn.fnamemodify(gitDir, ':h')
  -- end
  -- TODO: open in browser OR attach to clipboard
  return permalink
end

vim.api.nvim_create_user_command(
  'FindAll',
  find_all_vim_grep,
  { nargs = 1, desc = 'use vimgrep to search for all occurrences of a pattern in a project, add these to a quickfix list' }
)

vim.api.nvim_create_user_command(
  'GetGithubPermalink',
  get_github_permalink,
  { nargs = 0, desc = 'get the permalink url for the current line for github', bang = true }
)
