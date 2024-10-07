-- [[ Setting options ]]
-- See `:help vim.opt`
-- For more options, you can see `:help option-list`

-- Make line numbers default
vim.opt.number = true
-- You can also add relative line numbers, to help with jumping.
--  Experiment for yourself to see if you like it!
vim.opt.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 20

-- by default timoutlen is 1000ms
vim.opt.timeoutlen = 500

--faster completion
vim.opt.updatetime = 300

-- We don't need to see things like -- INSERT -- anymore
vim.opt.showmode = false

-- comma separated line rule for character width
vim.opt.colorcolumn = '80,120'

-- minimum num of columns reserved for the gutter
vim.opt.numberwidth = 2

-- always display the status line
vim.opt.laststatus = 0

-- so you can see `` in markdown files
vim.opt.conceallevel = 0

-- more space for displaying messages
vim.opt.cmdheight = 2

-- show cursor position at all times
vim.opt.ruler = true

-- insert 2 spaces for a tab
vim.opt.tabstop = 2

-- from :help vim.opt
-- vim.opt.formatoptions:append("j")  -- +=
-- vim.opt.formatoptions:prepend("j") -- ^=
-- vim.opt.formatoptions:remove("j")  -- -=

-- stop newline continuation for comments
vim.opt.formatoptions:remove 'cro'

-- treat dash separated words as a text object
vim.opt.iskeyword:append '-'

-- vim: ts=2 sts=2 sw=2 et
