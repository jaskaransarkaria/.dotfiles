local function find_all_vim_grep(opts)
  local vimgrepArgs = '/' .. opts.fargs[1] .. '/gj' .. '`find . -path ./.git -prune -o -type f`'
  return vim.api.nvim_cmd({ cmd = 'vimgrep', args = { vimgrepArgs } }, { output = false })
end

local function get_github_permalink()
  local current_line = vim.api.nvim__buf_stats(0).current_lnum
  local file_path = vim.fn.expand '%'
  local remote_url
  local main_commit_hash
  local rel_path

  local git_dir = vim.fn.finddir('.git', vim.fn.expand '%:p' .. ';', 1)

  local rel_root = string.gsub(git_dir, '.*/(.*)/.git', '%1')

  local esc_rel_root = string.gsub(rel_root, '%-', '%%-')

  if rel_root ~= '.git' then
    local cd_proj_path = string.gsub(git_dir, '/.git', '')

    remote_url = vim.fn.system('cd ' .. cd_proj_path .. '; git config --get remote.origin.url; cd -')

    main_commit_hash = vim.fn.system('cd ' .. cd_proj_path .. '; git rev-list main --first-parent | head -n 1; cd -')

    rel_path = string.gsub(file_path, '.*/' .. esc_rel_root .. '/(.*)', '%1')
  else
    remote_url = vim.fn.system 'git config --get remote.origin.url'

    main_commit_hash = vim.fn.system 'git rev-list main --first-parent | head -n 1'
  end

  local remove_ssh_git = string.gsub(remote_url, '(.*)%.git', '%1')
  local truncate_remote_url = string.gsub(remove_ssh_git, '.*@github.com.(.*)', '%1')
  local repo_name = string.gsub(truncate_remote_url, '.*/(.*)', '%1')
  local org_name = string.gsub(truncate_remote_url, '(.*)/.*', '%1')

  if rel_root == '.git' then
    local regex_match = '.*/' .. repo_name .. '/(.*)'
    local remove_newline = string.gsub(regex_match, '[\n\r]', '')
    local removed = string.gsub(file_path, remove_newline, '%1')
    rel_path = string.gsub(removed, '.*' .. repo_name .. '/', '')
  end

  local permalink = 'https://github.com/' .. org_name .. '/' .. repo_name .. '/blob/' .. main_commit_hash .. '/' .. rel_path .. '#L' .. current_line

  local remove_newline = string.gsub(permalink, '[\n\r]', '')

  vim.ui.open(remove_newline)
  vim.fn.setreg('+', remove_newline)
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
