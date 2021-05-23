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

  " emment for html and css completion and emments
  Plug 'mattn/emmet-vim'  

call plug#end()
