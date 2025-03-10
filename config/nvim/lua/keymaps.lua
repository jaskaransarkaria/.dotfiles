-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
vim.keymap.set('n', '<Esc>z', vim.diagnostic.hide, { desc = 'Zen Mode Hide diagnostic messages' })
vim.keymap.set('n', '<Esc>', vim.diagnostic.show, { desc = 'Show diagnostic messages' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Easy CAPS -- ctrl +u to capitalise word
vim.keymap.set('i', '<C-u>', '<ESC>viwUi', { desc = 'Capitalise letter from insert mode' })
vim.keymap.set('n', '<C-u>', 'viwU<ESC>', { desc = 'Capitalise letter from normal mode' })

-- TAB in general mode will move to text buffer
vim.keymap.set('n', '<Tab>', '<cmd>bnext<CR>', { desc = 'move to next buffer' })
vim.keymap.set('n', '<S-Tab>', '<cmd>bprevious<CR>', { desc = 'move to next buffer' })

-- Better tabbing -- holds the tab highlight until you're finished tabbing
vim.keymap.set('v', '<', '<gv', { desc = 'indent highlighted block left' })
vim.keymap.set('v', '>', '>gv', { desc = 'indent highlighted block right' })

vim.keymap.set('n', '<leader>v', ':vsplit<CR>', { desc = 'Duplicate current buffer in a vertical split' })

vim.keymap.set('n', '<leader>pl', ':GetGithubPermalink<CR>', { desc = 'get the github permalink for the line under the cursor' })

vim.keymap.set('n', '<leader>td', ':lua require("dap-go").debug_test()<CR>', { desc = 'debug this test nearest the cursor' })
-- vim: ts=2 sts=2 sw=2 et
