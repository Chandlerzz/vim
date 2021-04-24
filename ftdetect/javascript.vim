"au BufRead,BufNewFile *.js set filetype=js
autocmd FileType javascript nnoremap <buffer> <localleader>v :Setcomment<CR>
"autocmd FileType javascript inoremap <buffer> <localleader>v :Setcomment<CR>
autocmd FileType javascript vnoremap <buffer> <localleader>v :SetcommentV<CR>
"let currentline=0
"function! Commentjavascript()
"let lnum1 = line("'<")
"let lnum2 = line("'>")
"if g:currentline == 0
"    let g:currentline = lnum1
"endif
"execute g:currentline
"let line = getline(g:currentline)
"if line[0:1] != "//"
"    call setline(".","//" . getline("."))
"else
"    call setline(".",getline(".")[2:])
"endif
"if g:currentline == lnum2
"    let g:currentline=0
"else
"    let g:currentline += 1
"endif
"endfunction
"autocmd FileType javascript vnoremap <buffer> <localleader>c :s/^/\/\//g<CR>
"autocmd FileType javascript vnoremap <buffer> <localleader>b :s/^\/\///g<CR>
"autocmd FileType javascript vnoremap <buffer> <localleader>v :call Commentjavascript()<CR>

