"au BufRead,BufNewFile *.js set filetype=js
let currentline=0
function! Commentjavascript()
let [lnum1, col1] = getpos("'<")[1:2]
let [lnum2, col2] = getpos("'>")[1:2]
if g:currentline == 0
    let g:currentline = lnum1
endif
execute g:currentline
let line = getline(g:currentline)
if line[0:1] != "//"
    call setline(".","//" . getline("."))
    """""execute "s/^/\/\/\/"
else
    call setline(".",getline(".")[2:])
    ""execute "s/^\/\+//"
endif
if g:currentline == lnum2
    let g:currentline=0
else
    let g:currentline += 1
endif
"python3 << EOF
"from vim import *
"str1=current.line
"if str1[0] == "/":
"    current.line = str1[2:]
"    print(current.line)
"else:
"    current.line ="//"+ current.line
"    print(current.line)
"EOF
endfunction
"autocmd FileType javascript vnoremap <buffer> <localleader>c :s/^/\/\//g<CR>
"autocmd FileType javascript vnoremap <buffer> <localleader>b :s/^\/\///g<CR>
autocmd FileType javascript vnoremap <buffer> <localleader>v :call Commentjavascript()<CR>

