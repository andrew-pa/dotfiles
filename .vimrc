set nocompatible
set encoding=utf-8
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'flazz/vim-colorschemes'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'mhinz/vim-startify'
Plugin 'mbbill/undotree'
Plugin 'itchyny/lightline.vim'
Plugin 'taohex/lightline-buffer'
Plugin 'w0rp/ale'

Plugin 'rust-lang/rust.vim'
Plugin 'cespare/vim-toml'
Plugin 'racer-rust/vim-racer'

Plugin 'sirtaj/vim-openscad'
Plugin 'tikhomirov/vim-glsl'

call vundle#end()
filetype plugin indent on

syntax on
set background=dark
colorscheme base16-atelierforest "colorscheme jellybeans
set lines=60 columns=150 tabstop=4 shiftwidth=4 smarttab
set rop=type:directx,gamma:1.0,contrast:0.5,level:1,geom:1,renmode:4,taamode:1
set guifont=Consolas:h12:cANSI
set guioptions-=T
set guioptions-=m
set guioptions-=r
set guioptions-=L
set guioptions-=e
set fillchars=stl:\ ,stlnc:\ ,vert:\‖

set relativenumber
set hidden
set noshowmode
imap jk <Esc>
" map W -> w so that :w can be done while holding shift down the whole time
com! W w
au FocusLost * silent! :wa

" map Ctrl-V to paste
vmap <C-v> c<ESC>"+p
imap <C-v> <C-r><C-o>+

"check to see if gvimfullscreen.dll extention is avaliable, and if so map
"<F11> to toggle fullscreen
:if filereadable(expand("$VIMRUNTIME/gvimfullscreen.dll"))
:	map <expr> <F11> libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)
:endif

" ALE
let g:ale_sign_warning = '▲'
let g:ale_sign_error = '🗙'
highlight link ALEWarningSign String
highlight link ALEErrorSign Title

set laststatus=2
set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

set showtabline=2  " always show tabline
" use lightline-buffer in lightline
let g:lightline = {
	\ 'colorscheme': 'powerline',
	\ 'active': {
	\   'left': [['mode', 'paste'], ['gitbranch', 'filename', 'modified']],
	\   'right': [['percent', 'lineinfo'], ['readonly', 'fileformat', 'fileencoding', 'filetype'], ['linter_warnings', 'linter_errors', 'linter_ok'] ]
	\ },
	\ 'tabline': {
	\ 'left': [ [ 'bufferinfo' ], [ 'bufferbefore', 'buffercurrent', 'bufferafter' ], ],
	\ 'right': [ [ 'close' ], ],
	\ },
	\ 'component_expand': {
	\ 'buffercurrent': 'lightline#buffer#buffercurrent2',
	\   'linter_warnings': 'LightlineLinterWarnings',
	\   'linter_errors': 'LightlineLinterErrors',
	\ 'linter_ok': 'LightlineLinterOK'
	\ },
	\ 'component_type': {
	\ 'buffercurrent': 'tabsel',
	\   'readonly': 'error',
	\   'linter_warnings': 'warning',
	\ 'linter_errors': 'error',
	\ },
	\ 'component_function': {
	\ 'bufferbefore': 'lightline#buffer#bufferbefore',
	\ 'bufferafter': 'lightline#buffer#bufferafter',
	\ 'bufferinfo': 'lightline#buffer#bufferinfo',
	\ 'gitbranch': 'fugitive#head'
	\ },
	\ }

function! LightlineLinterWarnings() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d ◆', all_non_errors)
endfunction
function! LightlineLinterErrors() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d 🗙', all_errors)
endfunction
function! LightlineLinterOK() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '✓ ' : ''
endfunction

" Update and show lightline but only if it's visible (e.g., not in Goyo)
autocmd User ALELint call s:MaybeUpdateLightline()
function! s:MaybeUpdateLightline()
  if exists('#lightline')
    call lightline#update()
  end
endfunction

" remap arrow keys
nnoremap <Left> :bprev<CR>
nnoremap <Right> :bnext<CR>

" lightline-buffer ui settings
" replace these symbols with ascii characters if your environment does not support unicode
let g:lightline_buffer_logo = ''
let g:lightline_buffer_readonly_icon = '⦸'
let g:lightline_buffer_modified_icon = '✭'
let g:lightline_buffer_git_icon = ''
let g:lightline_buffer_ellipsis_icon = '…'
let g:lightline_buffer_expand_left_icon = '◀ '
let g:lightline_buffer_expand_right_icon = ' ▶'
let g:lightline_buffer_active_buffer_left_icon = ''
let g:lightline_buffer_active_buffer_right_icon = ''


" lightline-buffer function settings
let g:lightline_buffer_show_bufnr = 1
let g:lightline_buffer_rotate = 0
let g:lightline_buffer_fname_mod = ':t'
let g:lightline_buffer_excludes = ['vimfiler']

let g:lightline_buffer_maxflen = 30
let g:lightline_buffer_maxfextlen = 3
let g:lightline_buffer_minflen = 16
let g:lightline_buffer_minfextlen = 3
let g:lightline_buffer_reservelen = 20

let g:startify_enable_unsafe = -3
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

let g:racer_cmd = "C:\\Users\\andre\\.cargo\\bin\\racer.exe"
let g:racer_experimental_completer = 1

"hacky way to ensure that .md files are highlighted
"as markdown instead of modula
au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
