" program diary
" Fri 30 Jul 2021 04:41:57 PM CST
" 文件尾缀为.diary
" 第一种排序为按照顺序
" 第二种排序为按照 done todo 排序
" 在两种排序中转换
" 状态 done 已完成 todo 未完成
" done 后面跟日期 日期格式为 30/07/21
" color: done blue todo white
nnoremap <leader>dv :DiaryBefore<CR>:split $diarypath1<CR>:set nonumber<CR>:set norelativenumber<CR>
"nnoremap <leader>dv :execute "Diary"<CR>

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

