" filetype 'detection' vim will recognise the file type
filetype on
" loads the relevant plugin
filetype plugin on
" custom indentations
filetype indent on

set autowrite

let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

" go aut formating and importing
let g:go_fmt_command = "goimports"
let g:go_fmt_autosave = 1

" go syntax highlighting 
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_operators = 1

" go meta linter
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck'] " default setting
let g:go_metalinter_deadline = "5s" " default setting
let g:go_metalinter_autosave = 1

" status line types/ signatures
let g:go_auto_type_info = 1
let g:go_auto_sameids = 1

" get the function signature -- go_auto_type_info should show this
" autocmd FileType go nmap <Leader>i <Plug>(go-info)

" autocomplete appear when . pressed
au filetype go inoremap <buffer> . .<C-x><C-o>
