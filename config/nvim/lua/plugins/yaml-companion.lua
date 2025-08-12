return {
  'someone-stole-my-name/yaml-companion.nvim',
  dependencies = {
    { 'neovim/nvim-lspconfig' },
    { 'nvim-lua/plenary.nvim' },
    { 'nvim-telescope/telescope.nvim' },
  },
  config = function()
    local cfg = require('yaml-companion').setup {
      -- Add any options here, or leave empty to use the default settings
      builtin_matchers = {
        -- Detects Kubernetes files based on content
        kubernetes = { enabled = true },
        cloud_init = { enabled = false },
      },

      -- Additional schemas available in Telescope picker
      schemas = {
        {
          name = 'Kubernetes 1.33.3',
          uri = 'https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.33.3-standalone-strict/all.json',
        },
        { name = 'Argo cd workflows', uri = 'https://raw.githubusercontent.com/argoproj/argo-workflows/main/api/jsonschema/schema.json' },
      },

      -- Pass any additional options that will be merged in the final LSP config
      lspconfig = {
        cmd = { 'yaml-language-server' },
        flags = {
          debounce_text_changes = 150,
        },
        settings = {
          redhat = { telemetry = { enabled = false } },
          yaml = {
            validate = true,
            format = { enable = true },
            hover = true,
            schemaStore = {
              enable = false,
              url = '',
            },
            -- schemaStore = {
            --   enable = true,
            --   url = 'https://www.schemastore.org/api/json/catalog.json',
            -- },
            schemaDownload = { enable = true },
            schemas = {
              -- ['https://raw.githubusercontent.com/argoproj/argo-workflows/main/api/jsonschema/schema.json'] = 'workflow.{yaml,yml}',
            },
            trace = { server = 'debug' },
          },
        },
      },
    }

    require('lspconfig')['yamlls'].setup(cfg)
    require('telescope').load_extension 'yaml_schema'
  end,
  opts = {},
}
