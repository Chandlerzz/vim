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

function s:Todo() abort
  let $name = system("pwd | awk -F '/' '{ print $NF }'")
  let $length = len($name)-2
  let $name1 = $name[:$length]
  let $file = "~/todo" . "/" . $name1 
  echom $name
  silent ![[ -d ~/todo ]] && echo "nothing" || mkdir -p ~/todo
  silent !touch $file
  execute "vsplit" $file
  " windo diffthis
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
command -nargs=0  Todo  call s:Todo() 
command -nargs=1 -complete=file Man call s:Man(<f-args>)

