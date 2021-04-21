if exists("did_load_filetypes")
  finish
  endif
augroup filetypedetect
"" au BufNewFile,BufRead FileType javascript set omnifunc=javascriptcomplete#CompleteJS 
augroup END
