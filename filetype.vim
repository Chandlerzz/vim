if exists("did_load_filetypes")
  finish
  endif
augroup filetypedetect
autocmd FileType javascript vnoremap <buffer> <localleader>b :s/^/\/\//g<CR>
autocmd FileType python vnoremap <buffer> <localleader>b :s/^/\/\//g<CR>
augroup END

