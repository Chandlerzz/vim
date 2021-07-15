augroup mysql
    au!
    autocmd bufLeave *.vimrc call s:login()
augroup END
fun! s:login()
    call s:sourceConfigFile()
    let name = g:sql_name
    let database = g:sql_database
    let config = {"config":{"name": g:sql_name,"database": g:sql_database}}
    let configStr = string(config)
	let channel = ch_open('localhost:8765')
	let response = ch_evalexpr(channel, configStr)
endfun
fun! s:showCreateTable()
    let tableName = {"tableName":expand("<cword>")}
    let tableNameStr = string(tableName)
    let g:test = tableName
	let channel = ch_open('localhost:8765')
	let response = ch_evalexpr(channel, tableNameStr)
endfun
func! s:sourceConfigFile()
    execute "source %"
endfun

command! -nargs=0 BBB :call s:showCreateTable()
