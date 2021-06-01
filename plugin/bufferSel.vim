"" bufferSel
nnoremap <leader>bb :execute 'Bss'<CR>
nnoremap <leader>SetTcd :execute 'SetTcd'<CR>
function! NewTab()
    execute ":tabnew"
    execute ":tabnew"
    let @b="-SetTcd"
    let g:tabpath = ["/mnt/d/javascript_program/risentrain/applet-student","/mnt/d/javascript_program/risentrain/vue-admin","/mnt/d/javascript_program/risentrain/egg-server"]
endfunction
function! BufSelPwd()
    let pwd=getcwd()
    call BufSel(pwd)
endfunction
function! SetTcd()
    let tabPageNr = tabpagenr()
    execute "tcd " .g:tabpath[tabPageNr-1]
endfunction

function! BufSel(pattern)
  let bufcount = bufnr("$")
  let currbufnr = 1
  let nummatches = 0
  let firstmatchingbufnr = 0
  while currbufnr <= bufcount
    if(bufexists(currbufnr))
      let currbufname = expand('#'.currbufnr.':p') 
      if(match(currbufname, a:pattern) > -1)
        echo currbufnr . ": ".expand('#'.currbufnr.':p:.')
        let nummatches += 1
        let firstmatchingbufnr = currbufnr
      endif
    endif
    let currbufnr = currbufnr + 1
  endwhile
  if(nummatches == 1)
    execute ":buffer ". firstmatchingbufnr
  elseif(nummatches > 1)
    let desiredbufnr = input("Enter buffer number: ")
    if(strlen(desiredbufnr) != 0)
      execute ":buffer ". desiredbufnr
    endif
  else
    echo "No matching buffers"
  endif
endfunction

"Bind the BufSel() function to a user-command
command! -nargs=1 Bs :call BufSel("<args>")
command! -nargs=0 Bss :call BufSelPwd()
command! -nargs=0 NewTab :call NewTab()
command! -nargs=0 SetTcd :call SetTcd()
