nnoremap <leader>dv :DiaryBefore<CR>:split $diarypath1<CR>:set nonumber<CR>:set norelativenumber<CR>
"nnoremap <leader>dv :execute "Diary"<CR>

" Manual file myself Usage:Man myself
function s:Man(file) abort
  let $file = a:file
  let $file1 = "~/man/" . $file  
  execute "vsplit" $file1
endfunction

function s:Todo(file) abort
  let $file = a:file
  let $file1 = "~/todo/" . $file  
  execute "vsplit" $file1
endfunction

"Dairy every day record what stuff you have done today
function s:diary() abort
    let diary = system("date +'%Y/%m/%d'")
    let $diarypath = "~/report/" . diary
    let $diarypath1=$diarypath[:18]
    execute "redraw!"
    silent !bash $HOME/script/bash_script/diary.sh
    execute "split" $diarypath1
endfunction

function s:DiaryBefore() abort
    let diary = system("date +'%Y/%m/%d'")
    let $diarypath = "~/report/" . diary
    let $diarypath1=$diarypath[:18]
    execute "redraw!"
    silent !bash $HOME/script/bash_script/diary.sh
endfunction

command -nargs=0  Diary call s:diary() 
command -nargs=0  DiaryBefore  call s:DiaryBefore() 
command -nargs=1 -complete=file Man call s:Man(<f-args>)
command -nargs=1 -complete=file Todo  call s:Todo(<f-args>) 

