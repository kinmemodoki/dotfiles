set fenc=utf-8
set nobackup
set noswapfile
set autoread
set hidden
set showcmd

set number
set virtualedit=onemore
set smartindent
set visualbell
set showmatch
set laststatus=2
set wildmode=list:longest

noremap j gj
noremap k gk
noremap <C-h>   ^
noremap <C-j>   }
noremap <C-k>   {
noremap <C-l>   $
inoremap <C-l>  <Esc>$a
inoremap <C-h>  <Esc>^a

set list listchars=tab:\▸\-
set expandtab
set tabstop=2
set shiftwidth=2
set autoindent

set ignorecase
set smartcase
set incsearch
set wrapscan
set hlsearch

syntax on
colorscheme molokai



"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif
 
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim
 
call dein#begin('~/.vim/dein')
 
call dein#add('Shougo/dein.vim')
 
" dein でインストールするプラグインは以下のように書く
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('Shougo/neocomplete') 
call dein#add('Shougo/neocomplcache')

" リビジョンとかブランチ指定する時はこんな感じに書く
" call dein#add('Shougo/vimshell', { 'rev': '3787e5' })
 
call dein#end()
 
filetype plugin indent on
 
" インストールしてないプラグインを vim 起動時に自動的にインストールする設定
if dein#check_install()
  call dein#install()
endif
 
"End dein Scripts-------------------------


" neocomplcache--------------------------
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : ''
    \ }

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
"END neocomplcache------------------------
