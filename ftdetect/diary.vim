let diary = system("date +'%Y/%m/%d'")
let $diarypath = "~/report/" . diary
let $diarypath1=$diarypath[:18]
silent !bash $HOME/script/bash_script/diary.sh
nnoremap <leader>dv :vsplit $diarypath1<CR>
nnoremap <leader>av :execute "Diary"<CR>

" Manual file myself Usage:Man myself
function s:Man(file) abort
  let $file = a:file
  let $file1 = "~/man/" . $file  
  execute "vsplit" $file1
  "windo diffthis
endfunction

"Dairy every day record what stuff you have done today
function s:diary() abort
    let diary = system("date +'%Y/%m/%d'")
    let $diarypath = "~/report/" . diary
    let $diarypath1=$diarypath[:18]
    silent !bash $HOME/script/bash_script/diary.sh
    execute "vsplit" $diarypath1
endfunction

command -nargs=0  Diary call s:diary() 
command -nargs=1 -complete=file Man call s:Man(<f-args>)

