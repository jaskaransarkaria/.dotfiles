local curl = require 'plenary.curl'
local M = {
  schemas_catalog = 'datreeio/CRDs-catalog',
  schema_catalog_branch = 'main',
  github_base_api_url = 'https://api.github.com/repos',
  github_headers = {
    Accept = 'application/vnd.github+json',
    ['X-GitHub-Api-Version'] = '2022-11-28',
  },
}
M.schema_url = 'https://raw.githubusercontent.com/' .. M.schemas_catalog .. '/' .. M.schema_catalog_branch

local custom_schemas = {
  prettier = 'https://json.schemastore.org/prettierrc.json',
  github_workflow = 'https://json.schemastore.org/github-workflow.json',
  github_action = 'https://json.schemastore.org/github-action.json',
  chart = 'https://json.schemastore.org/chart.json',
  argo_workflow = 'https://raw.githubusercontent.com/argoproj/argo-workflows/main/api/jsonschema/schema.json',
  open_api = 'https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.1/schema.json',
  kustomization = 'https://www.schemastore.org/kustomization.json',
  dependabot = 'https://www.schemastore.org/dependabot-2.0.json',
  renovate = 'https://docs.renovatebot.com/renovate-schema.json',
  ansible_inventory = 'https://raw.githubusercontent.com/ansible/ansible-lint/main/src/ansiblelint/schemas/inventory.json',
  ansible_collection_galaxy = 'https://raw.githubusercontent.com/ansible/ansible-lint/main/src/ansiblelint/schemas/galaxy.json',
  ansible_playbook = 'https://raw.githubusercontent.com/ansible/ansible-lint/main/src/ansiblelint/schemas/ansible.json#/$defs/playbook',
  ansible_tasks = 'https://raw.githubusercontent.com/ansible/ansible-lint/main/src/ansiblelint/schemas/ansible.json#/$defs/tasks',
  ansible_vars = 'https://raw.githubusercontent.com/ansible/ansible-lint/main/src/ansiblelint/schemas/vars.json',
  ansible_requirements = 'https://raw.githubusercontent.com/ansible/ansible-lint/main/src/ansiblelint/schemas/requirements.json',
}

M.list_github_tree = function()
  local url = M.github_base_api_url .. '/' .. M.schemas_catalog .. '/git/trees/' .. M.schema_catalog_branch
  local response = curl.get(url, { headers = M.github_headers, query = { recursive = 1 } })
  local body = vim.fn.json_decode(response.body)
  local trees = {}
  for _, tree in ipairs(body.tree) do
    if tree.type == 'blob' and tree.path:match '%.json$' then
      table.insert(trees, tree.path)
    end
  end
  return trees
end

M.init = function()
  local all_crds = M.list_github_tree()
  for k, _ in pairs(custom_schemas) do
    table.insert(all_crds, k)
  end

  vim.ui.select(all_crds, { prompt = 'Select schema: ' }, function(selection)
    if not selection then
      vim.notify('Canceled.', vim.log.levels.WARN, {})
      return
    end

    local schema_url = M.schema_url .. '/' .. selection

    if custom_schemas[selection] then
      schema_url = custom_schemas[selection]
    end

    local schema_modeline = '# yaml-language-server: $schema=' .. schema_url
    vim.api.nvim_buf_set_lines(0, 0, 0, false, { schema_modeline })
    vim.notify('Added schema modeline: ' .. schema_modeline)
  end)
end
return M
