" Prettier Settings
nmap <Leader>p <Plug>(Prettier)
let g:prettier#quickfix_enabled = 0
let g:prettier#autoformat = 1
"let g:prettier#autoformat_config_present = 1 " this overrides the autoformat setting
let g:prettier#autoformat_require_pragma = 0
au BufWritePre *.css,*.svelte,*.pcss,*.html,*.ts,*.js,*.json PrettierAsync

