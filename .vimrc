set nocompatible
set encoding=utf-8
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
Plugin 'mbbill/undotree'

Plugin 'rust-lang/rust.vim'
Plugin 'cespare/vim-toml'
Plugin 'racer-rust/vim-racer'

Plugin 'sirtaj/vim-openscad'

call vundle#end()
filetype plugin indent on

syntax on
colorscheme jellybeans
set lines=60 columns=150 tabstop=4 shiftwidth=4 smarttab
set rop=type:directx,gamma:1.0,contrast:0.5,level:1,geom:1,renmode:4,taamode:1
set guifont=Consolas:h12:cANSI
set guioptions-=T
set guioptions-=m
set guioptions-=r
set guioptions-=L
set fillchars=vert:\‖

set relativenumber
set hidden
imap jk <Esc> 
" map W -> w so that :w can be done while holding shift down the whole time
com! W w
au FocusLost * silent! :wa


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

if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▒'
let g:airline_right_sep = '«'
let g:airline_right_sep = '▒'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'


let g:syntastic_cpp_compiler_options = "-std=c++14"

let g:startify_enable_unsafe = 0
if v:version == 704
	let g:ascii_art_header = [
		\ '                                 ________  __ __        ',
		\ '            __                  /\_____  \/\ \\ \       ',
		\ '    __  __ /\_\    ___ ___      \/___//''/''\ \ \\ \    ',
		\ '   /\ \/\ \\/\ \ /'' __` __`\        /'' /''  \ \ \\ \_ ',
		\ '   \ \ \_/ |\ \ \/\ \/\ \/\ \      /'' /''__  \ \__ ,__\',
		\ '    \ \___/  \ \_\ \_\ \_\ \_\    /\_/ /\_\  \/_/\_\_/  ',
		\ '     \/__/    \/_/\/_/\/_/\/_/    \//  \/_/     \/_/    ',
		\ ]
elseif v:version == 800
	let g:ascii_art_header = [
		\ '                               ________         ________',
		\ '            __                |\  ____ \       |\  ____ \',
		\ '    __  __ /\_\    ___ ___    \ \ \___\ \      \ \ \__|\ \',
		\ '   /\ \/\ \\/\ \ /'' __` _`\    \ \ \___\ \      \ \ \  \\ \',
		\ '   \ \ \ | \\ \ \/\ \/\ \/\ \   \ \ \__|\ \      \ \ \  \\ \',
		\ '    \ \ \/ | \ \ \ \ \ \ \ \ \   \ \ \___\ \   __ \ \ \___\ \',
		\ '     \ \___/  \ \_\ \_\ \_\ \_\   \ \_______\ /\_\ \ \_______\',
		\ '      \/__/    \/_/\/_/\/_/\/_/    \/_______/ \/_/  \/_______/',
		\ ]
endif

let g:startify_custom_header = map(g:ascii_art_header + startify#fortune#cowsay(), '"   ".v:val')

let g:racer_experimental_completer = 1

"hacky way to ensure that .md files are highlighted 
"as markdown instead of modula
au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
