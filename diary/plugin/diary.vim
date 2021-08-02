" program diary
" Fri 30 Jul 2021 04:41:57 PM CST
" 文件尾缀为.diary
" 第一种排序为按照顺序
" 第二种排序为按照 done todo 排序
" 在两种排序中转换
" 状态 done 已完成 todo 未完成
" done 后面跟日期 日期格式为 30/07/21
" color: done blue todo white
nnoremap <leader>dv :Diary<CR>
function s:sort(state) abort
  let state = a:state
  let line = getline()
  let lineCount = line("$")
  let currlinenr = 1
  let nummatches = 0
  while currlinenr <= lineCount
      if(match(getline(currlinenr),state)) 
          let nummatches =nummatches + 1 
          let result = setline(nummatches,getline(currlinenr))
          let result = setline(currlinenr,"")
      endif
    let currlinenr = currlinenr + 1
  endwhile
endfunction

function s:diary() abort
    let diary = system("date +'%Y/%m/%d'")
    let $diarypath = "~/report/" . diary
    let g:test = $diarypath
    let $diarypath1=$diarypath[:18]
    let $diarypath1 = $diarypath1 . ".diary"
    silent !bash $HOME/vim/diary/diary.sh
    execute "split $diarypath1"
    execute "redraw!"
endfunction

command -nargs=0  Diary call s:diary() 
