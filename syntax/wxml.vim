setlocal foldmethod=syntax
" todo 
" first to open the reame directory wxss file and goto gotto the line searched
"get the absolutepath and find hte wxss and then vsp the wxss file 

function! JumpFromWxmlToWxssForSearch()
    let currentword=expand("<cword>")
    let bufnr = bufnr()
    let $filepath=expand('#'.bufnt.':p:r')
    let $filepath=$filepath.".wxss"
    execute "normal \<c-w>o"
    execute ":vsp".$filepath
    execute ":Sch ".currentword
endfunction
command! -nargs=0 Jss :call JumpFromWxmlToWxssForSearch()


