return {
  'cenk1cenk2/schema-companion.nvim',
  dependencies = {
    { 'nvim-lua/plenary.nvim' },
    { 'nvim-telescope/telescope.nvim' },
  },
  config = function()
    -- PLEASE FOLLOW THE CONFIGURATION INSTRUCTIONS BELOW SINCE THERE IS AN ADDITIONAL STEP NEEDED FOR EACH LANGUAGE SERVER
    require('schema-companion').setup {
      -- if you have telescope you can register the extension
      enable_telescope = true,
      matchers = {
        -- add your matchers
        require('schema-companion.matchers.kubernetes').setup { version = 'master' },
      },
    }
    --
    -- require('lspconfig').yamlls.setup(require('schema-companion').setup_client {
    --   -- settings = { yaml = { schemas = { kubernetes =  'https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.22.1-standalone/all.json'}}}
    --   enabled = true,
    --   enabledForFilesGlob = '*.{yaml,yml}',
    --   diagnosticsLimit = 50,
    --   showDiagnosticsDirectly = false,
    --   path = 'yaml-language-server',
    --   initTimeoutSeconds = 3,
    --   config = {
    --     schemas = {
    --       -- kubernetes = '*',
    --       -- ['https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.33.3/all.json'] = '*',
    --       ['https://raw.githubusercontent.com/argoproj/argo-workflows/main/api/jsonschema/schema.json'] = 'workflow.{yaml,yml}',
    --     },
    --     schemaStore = {
    --       enable = false,
    --       url = '',
    --     },
    --     completion = true,
    --     hover = true,
    --     -- any other config from https://github.com/redhat-developer/yaml-language-server#language-server-settings
    --   },
    -- })

    -- require('lspconfig').helm_ls.setup(require('schema-companion').setup_client {
    --   settings = {
    --     ['helm-ls'] = {
    --       logLevel = 'info',
    --       valuesFiles = {
    --         mainValuesFile = 'values.yaml',
    --         lintOverlayValuesFile = 'values.lint.yaml',
    --         additionalValuesFilesGlobPattern = 'values*.yaml',
    --       },
    --       helmLint = {
    --         enabled = true,
    --         ignoredMessages = {},
    --       },
    --       yamlls = {
    --         -- settings = { yaml = { schemas = { kubernetes =  'https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.22.1-standalone/all.json'}}}
    --         enabled = true,
    --         enabledForFilesGlob = '*.{yaml,yml}',
    --         diagnosticsLimit = 50,
    --         showDiagnosticsDirectly = false,
    --         path = 'yaml-language-server',
    --         initTimeoutSeconds = 3,
    --         config = {
    --           schemas = {
    --             -- kubernetes = '*',
    --             -- ['https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.33.3/all.json'] = '*.{yaml,yml}',
    --             ['https://raw.githubusercontent.com/argoproj/argo-workflows/main/api/jsonschema/schema.json'] = 'workflow.{yaml,yml}',
    --           },
    --           schemaStore = {
    --             enable = false,
    --             url = '',
    --           },
    --           completion = true,
    --           hover = true,
    --           -- any other config from https://github.com/redhat-developer/yaml-language-server#language-server-settings
    --         },
    --       },
    --     },
    --   },
    -- })
    -- require('telescope').load_extension 'schema'
  end,
}
