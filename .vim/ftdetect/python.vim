"au BufRead,BufNewFile *.py set filetype=py
autocmd FileType python     nnoremap <buffer> <localleader>c I#<esc>
autocmd FileType python     :iabbrev <buffer> iff if:<left>

