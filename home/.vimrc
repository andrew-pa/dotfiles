set nocompatible
set encoding=utf-8

" display options
set guioptions=
colorscheme noctu

" editor options
syntax on
set number relativenumber
" set signcolumn=number
set laststatus=2
set hidden noshowmode nohlsearch title
set completeopt=longest,menuone
au FocusLost * silent! :wa
set softtabstop=4 shiftwidth=4 
set expandtab cursorline
set updatetime=16
set list
set listchars=tab:––→,trail:~,extends:>,precedes:<,space:·
set linebreak breakindent
set showbreak=⮑
set fillchars+=vert:\ 
set signcolumn=number

source ~/.vim/common.vim

imap <C-V> <C-R>*

tnoremap <Esc> <C-w>N
tnoremap <Esc><Space> <C-w>w

"statusline
set statusline=%<%f\ %q%h%m%r\ \ %=%-26.(%y\ ln\ %l\ col\ %v%)\ %P
set titlestring=vim\ [%F\ %P]
