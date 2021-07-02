" Vim syntax file
" Language: Vue.js
" Maintainer: Eduardo San Martin Morote

if exists("b:current_syntax")
  finish
endif

let g:test="1"
runtime! syntax/sql.vim
unlet b:current_syntax
let b:current_syntax = "sqls"
