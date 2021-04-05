"au BufRead,BufNewFile *.js set filetype=js
autocmd FileType javascript nnoremap <buffer> <localleader>c I//<esc>
autocmd FileType javascript :iabbrev <buffer> iff if()<left>
autocmd FileType javascript :iabbrev <buffer> func function(){<cr><cr>}<left>
autocmd FileType javascript set tabstop=2 

