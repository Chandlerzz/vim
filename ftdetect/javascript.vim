"au BufRead,BufNewFile *.js set filetype=js
autocmd FileType javascript vnoremap <buffer> <localleader>c :s/^/\/\//g<CR>
autocmd FileType javascript vnoremap <buffer> <localleader>b :s/^\/\///g<CR>

