"from syntax/json.vim
syn region  jsonFold matchgroup=jsonBraces start="\(default \)\@<!{" end=/}\(\_s\+\ze\("\|{\)\)\@!/ transparent fold
syn region  jsonFold matchgroup=jsonBraces start="\[" end=/]\(\_s\+\ze"\)\@!/ transparent fold
