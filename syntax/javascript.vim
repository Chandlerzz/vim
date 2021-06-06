"from syntax/json.vim
syn region  jsonFold matchgroup=jsonBraces start="\(default \|Controller \|=> \)\@<!{" end=/}\(\_s\+\ze\("\|{\)\)\@!/ transparent fold
syn region  jsonFold matchgroup=jsonBraces start="\[" end=/]\(\_s\+\ze"\)\@!/ transparent fold

syn region importfold start="\(import\|require\)" end="^$" fold 
