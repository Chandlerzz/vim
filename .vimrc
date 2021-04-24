""ctags config
set tags=tags
"set autochdir
""leaderf gtags, but I don't know how to use it.
"let g:Lf_GtagsAutoGenerate = 1
"let g:Lf_Gtagslabel = 'native-pygments'
silent !if [ -z "$(cat .gitignore | grep .man)" ]; then cat .gitignore && echo .man >> .gitignore; fi
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set foldmethod=indent
set nofoldenable
set number
set so=5
set laststatus=2
let mapleader = "-"
let maplocalleader = "\\"
noremap <leader>m :marks<CR>
xnoremap <leader>p "_dp
imap jj <esc>  
nnoremap <c-s> :w<CR>
vmap <c-s> <Esc><c-s>gv
imap <c-s> <Esc><c-s>
"" clipbord map
inoremap <C-v> <ESC>"+pa
vnoremap <C-c> "+y
vnoremap <C-d> "+d
nnoremap <leader>m :marks<cr>
""" move to html tab to insert word in normal mode
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>bv :vsplit ~/.bashrc<cr>
nnoremap <leader>sv :vsplit .man<cr>
map <C-right> <ESC>:bn<CR>
map <C-left> <ESC>:bp<CR>
noremap <C-F> :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR>
syntax on

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"""set the directory presentation
let g:netrw_browse_split = 4
let g:netrw_lists = 3
let g:netrw_banner = 0
let g:netrw_winsize = 25
inoremap cl console.log()<Esc>i
nnoremap <leader>cc iselect * from  where 1+1<Esc>0fmla
nnoremap <leader>z V%"zy% 
cmap w!! w !sudo tee > /dev/null %
if has ('autocmd')
	augroup Reload_Vimrc
	autocmd!
	autocmd! BufWritePost $MYVIMRC source % | echom "Reloaded" . $MYVIMRC | redraw
	augroup end
endif " has aoutocmd
call plug#begin('~/.vim/bundle')
Plug 'mattn/emmet-vim'
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
Plug 'chemzqm/wxapp.vim'
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
call plug#end()


let g:user_emmet_settings = {
  \ 'wxss': {
  \   'extends': 'css',
  \ },
  \ 'wxml': {
  \   'extends': 'html',
  \   'aliases': {
  \     'div': 'view',
  \     'span': 'text',
  \   },
  \  'default_attributes': {
  \     'block': [{'wx:for-items': '{{list}}','wx:for-item': '{{item}}'}],
  \     'navigator': [{'url': '', 'redirect': 'false'}],
  \     'scroll-view': [{'bindscroll': ''}],
  \     'swiper': [{'autoplay': 'false', 'current': '0'}],
  \     'icon': [{'type': 'success', 'size': '23'}],
  \     'progress': [{'precent': '0'}],
  \     'button': [{'size': 'default'}],
  \     'checkbox-group': [{'bindchange': ''}],
  \     'checkbox': [{'value': '', 'checked': ''}],
  \     'form': [{'bindsubmit': ''}],
  \     'input': [{'type': 'text'}],
  \     'label': [{'for': ''}],
  \     'picker': [{'bindchange': ''}],
  \     'radio-group': [{'bindchange': ''}],
  \     'radio': [{'checked': ''}],
  \     'switch': [{'checked': ''}],
  \     'slider': [{'value': ''}],
  \     'action-sheet': [{'bindchange': ''}],
  \     'modal': [{'title': ''}],
  \     'loading': [{'bindchange': ''}],
  \     'toast': [{'duration': '1500'}],
  \     'audio': [{'src': ''}],
  \     'video': [{'src': ''}],
  \     'image': [{'src': '', 'mode': 'scaleToFill'}],
  \   }
  \ },
  \}
function! SuperTab()
  let l:part = strpart(getline('.'),col('.')-2,1)
  if (l:part =~ '^\W\?$')
      return "\<Tab>"
  else
      return "\<C-n>"
  endif
endfunction

imap <Tab> <C-R>=SuperTab()<CR>


