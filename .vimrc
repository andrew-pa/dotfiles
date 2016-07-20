set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/syntastic'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'nanotech/jellybeans.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-fugitive'
Plugin 'mhinz/vim-startify'

Plugin 'rust-lang/rust.vim'
Plugin 'cespare/vim-toml'
Plugin 'racer-rust/vim-racer'

call vundle#end()
filetype plugin indent on

syntax on
colorscheme jellybeans
set lines=60 columns=150
set guifont=Consolas:h12:cANSI
set guioptions-=T
set guioptions-=m
set guioptions-=r
set guioptions-=L

set relativenumber
imap jk <Esc> 

"check to see if gvimfullscreen.dll extention is avaliable, and if so map
"<F11> to toggle fullscreen
:if filereadable(expand("$VIMRUNTIME/gvimfullscreen.dll"))
:	map <expr> <F11> libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0) 
:endif


set laststatus=2
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:airline#extensions#tabline#enabled = 1

let g:syntastic_cpp_compiler_options = "-std=c++14"

let g:startify_enable_unsafe = 0
let g:ascii_art_header = [
            \ '                                 ________  __ __        ',
            \ '            __                  /\_____  \/\ \\ \       ',
            \ '    __  __ /\_\    ___ ___      \/___//''/''\ \ \\ \    ',
            \ '   /\ \/\ \\/\ \ /'' __` __`\        /'' /''  \ \ \\ \_ ',
            \ '   \ \ \_/ |\ \ \/\ \/\ \/\ \      /'' /''__  \ \__ ,__\',
            \ '    \ \___/  \ \_\ \_\ \_\ \_\    /\_/ /\_\  \/_/\_\_/  ',
            \ '     \/__/    \/_/\/_/\/_/\/_/    \//  \/_/     \/_/    ',
            \ ]
let g:startify_custom_header = map(g:ascii_art_header + startify#fortune#cowsay(), '"   ".v:val')

set hidden
let g:racer_experimental_completer = 1
