# Nvim plugins

## Lazy

Plugins are managed via Lazy, to check the current status of plugins run `:Lazy`. You can press `?` for help and `:Lazy update` to update the plugins.

Plugins can be configured to run Lua code when they are loaded using the init block. And, we can use the config block to run lua code when the plugin has been loaded. Plugins can be lazy loaded, so they aren't loaded immediately on startup. You can load a plugin on events eg. `event = 'VimEnter'` (find other autocommand events with `:help autocmd-events`)

## LSP vs treesitter

LSPs understands code a project level so you can rename across files, find deinitions in external libraries etc. whereas Treesitter is a language parsing library which makes it good at understanding the contents of the current buffer with things like syntax highlighting, simple goto defs, scope analysis etc. see `:help lsp-vs-treesitter` for more.

The plugins I use are listed and briefly explained here:

## [windwp/nvim-autopairs](https://github.com/windwp/nvim-autopairs)

A super powerful autopair plugin for Neovim that supports multiple characters

## [stevearc/conform](https://github.com/stevearc/conform.nvim)

Lightweight yet powerful formatter plugin

## [mfussenegger/nvim-dap](https://github.com/mfussenegger/nvim-dap)

Debug Adapter Protocol client implementation

## [lewis6991/gitsign](https://github.com/lewis6991/gitsigns.nvim)s

Adds git related signs to the gutter, as well as utilities for managing changes

## [lukas-reineke/indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)

Adds indentation guides even on blank lines

## [mfussenegger/nvim-lint](https://github.com/mfussenegger/nvim-lint)

An asynchronous linter plugin for Neovim complementary to the built-in Language Server Protocol support. It spawns linters, parses their outputs and reports the results via the `vim.diagnostic` module. This plugin complements the built-in language server client for languages where there are no language servers, or where standalone linters provide better results.

## [echasnovski/mini.nvim](https://github.com/echasnovski/mini.nvim)

Library of 40+ independent Lua modules improving overall Neovim (version 0.8 and higher) experience with minimal effort. They all share same configuration approaches and general design principles.

Think about this project as "Swiss Army knife" among Neovim plugins: it has many different independent tools (modules) suitable for most common tasks. Each module can be used separately without any startup and usage overhead.

## [hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp)

An auto-completion engine plugin for neovim written in Lua. Completion sources are installed from external repositories and "sourced".

## neovim/nvim-lspconfig

Nvim supports the Language Server Protocol (LSP), which means it acts as a client to LSP servers, which use the standardised LSP [repo](https://microsoft.github.io/language-server-protocol). You have a "server" which is some tool built **externally** to understand a particular language eg. "gopls", these servers communicate with the neovim client.

The LSP provides features like:

- Go to definition
- Find references
- Autocompletion
- Symbol search
- Documentation on hover
- and more!

## [nvim-tree/nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua)

A file explorer tree for neovim written in lua

## [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)

Telescope is a highly extendable fuzzy finder over lists. Find, filter, preview, pick, all in lua and leverages fzf. It's more than just a "file finder", it can search many different aspects of Neovim, your workspace, LSP and more!

## [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)

Provides a simple and easy way to use the interface for tree-sitter in Neovim and to provide some basic functionality such as highlighting, edtting and navigating

## [folke/which-key.nvim](https://github.com/folke/which-key.nvim)

WhichKey helps you remember your Neovim keymaps, by showing available keybindings in a popup as you type

## [folke/lazy.nvim](https://github.com/folke/lazy.nvim)

lazy.nvim is a modern plugin manager for Neovim. In `lua-bootstrap.lua` where we install this plugin before others, then in `lazy-plugins.lua` we configure and install all the other plugins in the setup block

## [tpope/vim-slueth](https://github.com/tpope/vim-sleuth)

 Heuristically based on the current file set buffer options. Detect `tabstop`, `expandtab` and `shiftwidth` automatically

## [folke/lazydev.nvim](https://github.com/folke/lazydev.nvim)

Configures Lua LSP for your Neovim config by lazily updating your workspace libraries, runtime and plugins. Used for completion, annotations and signatures of Neovim apis

## [bilal2453/luvit-meta](https://github.com/Bilal2453/luvit-meta)

A collection of definition files for the lua framework Luvit

## [folke/todo-comments.nvim](https://github.com/folke/todo-comments.nvim)

Highlight todo, note, warn, perf, test, hack etc in comments

## [sawwilliamboman/mason](https://github.com/williamboman/mason.nvim)

Portable package manager for Neovim. Easily install and manage LSP servers, DAP servers, linters, and formatters

## [bullets-vim/bullets.vim](https://github.com/bullets-vim/bullets.vim)

Bullets.vim is a Vim/NeoVim plugin for automated bullet lists

## [ray-x/go.nvim](https://github.com/ray-x/go.nvim)

Useful Go plugin with lots of features, including snippets, generating tests and lots more.

### Colour schemes

If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`

#### [navarasu/onedark.nvim](https://github.com/navarasu/onedark.nvim)

Dark and Light Themes for neovim >= 0.5 based on Atom One Dark & Atom One Light theme written in lua with TreeSitter syntax highlight

#### [folke/tokyonight.nvim](https://github.com/folke/tokyonight.nvim)

A clean dark Neovim theme written in Lua
