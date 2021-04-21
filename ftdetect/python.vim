"au BufRead,BufNewFile *.py set filetype=py
function! Comment()
let [lnum1, col1] = getpos("'<")[1:2]
let [lnum2, col2] = getpos("'>")[1:2]
let lines = getline(lnum1, lnum2)
normal
for i in range(lnum1,lnum2)
    call setline("0"+i,"//")
endfor
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
autocmd FileType python vnoremap <buffer> <localleader>c :s/^/#/g<CR>
autocmd FileType python vnoremap <buffer> <localleader>b :s/^#//g<CR>
    
    
