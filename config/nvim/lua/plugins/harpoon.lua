return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local harpoon = require 'harpoon'
    local conf = require('telescope.config').values
    local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      require('telescope.pickers')
        .new({}, {
          prompt_title = 'Harpoon',
          finder = require('telescope.finders').new_table {
            results = file_paths,
          },
          previewer = conf.file_previewer {},
          sorter = conf.generic_sorter {},
        })
        :find()
    end

    harpoon.setup {
      vim.keymap.set('n', '<leader>m', function()
        harpoon:list():add()
      end),
      vim.keymap.set('n', '<C-e>', function()
        toggle_telescope(harpoon:list())
      end, { desc = 'Open harpoon window' }),

      vim.keymap.set('n', '<leader>m1', function()
        harpoon:list():select(1)
      end),
      vim.keymap.set('n', '<leader>m2', function()
        harpoon:list():select(2)
      end),
      vim.keymap.set('n', '<leader>m3', function()
        harpoon:list():select(3)
      end),
      vim.keymap.set('n', '<leader>m4', function()
        harpoon:list():select(4)
      end),

      -- Toggle previous & next buffers stored within Harpoon list
      vim.keymap.set('n', '<leader>mp', function()
        harpoon:list():prev()
      end),
      vim.keymap.set('n', '<leader>mn', function()
        harpoon:list():next()
      end),
    }

    harpoon:extend {
      UI_CREATE = function(cx)
        vim.keymap.set('n', '<C-v>', function()
          harpoon.ui:select_menu_item { vsplit = true }
        end, { buffer = cx.bufnr })

        vim.keymap.set('n', '<C-x>', function()
          harpoon.ui:select_menu_item { split = true }
        end, { buffer = cx.bufnr })

        vim.keymap.set('n', '<C-t>', function()
          harpoon.ui:select_menu_item { tabedit = true }
        end, { buffer = cx.bufnr })
      end,
    }
  end,
}
