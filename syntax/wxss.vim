"from syntax/json.vim
" syn region  jsonFold matchgroup=jsonBraces start="\(default \|Controller \|=> \)\@<!{" end=/}\(\_s\+\ze\("\|{\)\)\@!/ transparent fold
" syn region  jsonFold matchgroup=jsonBraces start="\[" end=/]\(\_s\+\ze"\)\@!/ transparent fold

" syn region importfold start="\(import\|require\)" end="^$" fold 
setlocal foldmethod=syntax
function! JumpFromWxssToWxmlForSearch()
    let wincount=winnr("$")
    let currentword=expand("<cword>")
    let bufnr = bufnr()
    let $filepath=expand('#'.bufnr.':p:r')
    let $filepath=$filepath.".wxml"
    execute "normal \<c-w>o"
    execute ":vsp".$filepath
    execute ":Sch ".currentword
endfunction
command! -nargs=0 Jml :call JumpFromWxssToWxmlForSearch()
