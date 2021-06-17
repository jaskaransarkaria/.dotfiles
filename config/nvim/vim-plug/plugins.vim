call plug#begin('~/.local/share/nvim/plugged')
 
  " Better Syntax Support
  Plug 'sheerun/vim-polyglot'

  " vim bottom bar theme 
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  
  " Auto pairs for '(' '[' '{'
  Plug 'jiangmiao/auto-pairs'
  
  " vim themes
  Plug 'wadackel/vim-dogrun'
  Plug 'joshdick/onedark.vim'
  
  " Intellisense
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  " fuzzy finder -- fzf
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  
  " allow fzf to be scoped to project when searching
  Plug 'airblade/vim-rooter'

  " Intelephense -- php
  Plug 'yaegassy/coc-intelephense', {'do': 'yarn install --frozen-lockfile'}

  " Navigate and manipulate files in a tree view.
  Plug 'lambdalisue/fern.vim'

  " emmet for html and css completion and emmets
  Plug 'mattn/emmet-vim'

  " svelte js syntax highlighting
  Plug 'evanleck/vim-svelte', {'branch': 'main'}

  " prettier linter
  " post install (yarn install | npm install) then load plugin only for editing supported files
  Plug 'prettier/vim-prettier', { 'do': 'npm install' }

  " typescript plugin
  Plug 'HerringtonDarkholme/yats.vim'

call plug#end()
