"set number
"highlight LineBr guibg=NONE
"highlight clear LineNr
highlight clear StatusLine
set nocompatible              " be iMproved, required

set tabstop=4
set shiftwidth=4
set expandtab

filetype off                  " required
" set the runtime path to include Vundle and initialize
"
set rtp+=~/.config/nvim/pack/bundle/start/Vundle.vim

set runtimepath+=~/.vim-plugins/LanguageClient-neovim

call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'dense-analysis/ale'
"Plugin 'psf/black'

" All of your Plugins must be added before the following line
call vundle#end()        " required

autocmd BufWritePre *.py execute ':Black'

autocmd BufWritePre *.js execute ':ALEFix'

filetype plugin indent on    " required

" To ignore plugin indent changes, instead use:
"filetype plugin on


"Map key leader.
let mapleader=","

" For JavaScriptfiles,use `eslint`(andonlyeslint)
let g:ale_linters= { 'javascript': ['eslint'],}
nmap <silent> <leader>W <Plug>(ale_first)
nmap <silent> <leader>w <Plug>(ale_previous)
nmap <silent> <leader>w <Plug>(ale_next)
nmap <silent> <leader>W <Plug>(ale_last)

" Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1
"prettier
let g:ale_fixers = {
\	'css': ['prettier'],
\   'javascript': ['eslint'],
\   'python': ['black'],
\}

" Vetur server
"let g:LanguageClient_serverCommands = {
"    \ 'vue': ['vls']
"    \ } 
