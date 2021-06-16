nnoremap <expr> <F4> CountSpaces()
xnoremap <expr> <F4> CountSpaces()
" doubling <F4> works on a line
nnoremap <expr> <F4><F4> CountSpaces() .. '_'

function CountSpaces(type = '') abort
  if a:type == ''
    set opfunc=CountSpaces
    return 'g@'
  endif

  let sel_save = &selection
  let reg_save = getreginfo('"')
  let g:aaa=reg_save
  let cb_save = &clipboard
  let visual_marks_save = [getpos("'<"), getpos("'>")]

  try
    set clipboard= selection=inclusive
    let commands = #{line: "'[V']y", char: "`[v`]y", block: "`[\<c-v>`]y"}
    silent exe 'noautocmd keepjumps normal! ' .. get(commands, a:type, '')
    echom getreg('"')
    " echom getreg('"')->count(' ')
  finally
    let reg_save ='1'
  silent exe 'norm! gv'.'"bp`['
    call setreg('"', reg_save)
    call setpos("'<", visual_marks_save[0])
    call setpos("'>", visual_marks_save[1])
    let &clipboard = cb_save
    let &selection = sel_save
  endtry
endfunction
