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
let g:ale_sign_warning = '⯁'
let g:ale_sign_error = '🞬'
highlight link ALEWarningSign String
highlight link ALEErrorSign Title

set laststatus=2
set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

set showtabline=2  " always show tabline

" Common colors
let s:fg     = '#bfbdbb'
let s:blue   = '#61afef'
let s:green  = '#98c379'
let s:purple = '#c668ed'
let s:red1   = '#e06c75'
let s:red2   = '#be5046'
let s:brightyellow = '#efaf61'
let s:yellow = '#ef5f31'

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}

" Dark variant
let s:bg     = '#282420'
let s:gray1  = '#4e5350'
let s:gray2  = '#322c2d'
let s:gray3  = '#474436'

let s:p.normal.left     = [ [ s:bg, s:green, 'bold' ], [ s:fg, s:gray3 ] ]
let s:p.normal.middle   = [ [ s:fg, s:gray2 ] ]
let s:p.inactive.left   = [ [ s:gray1,  s:bg ], [ s:gray3, s:bg ] ]
let s:p.inactive.middle = [ [ s:gray1, s:gray2 ] ]
let s:p.inactive.right  = [ [ s:gray1, s:bg ], [ s:gray3, s:bg ] ]
let s:p.insert.left     = [ [ s:bg, s:blue, 'bold' ], [ s:fg, s:gray3 ] ]
let s:p.replace.left    = [ [ s:bg, s:red1, 'bold' ], [ s:fg, s:gray3 ] ]
let s:p.visual.left     = [ [ s:bg, s:yellow, 'bold' ], [ s:fg, s:gray3 ] ]

" Common
let s:p.normal.right   = [ [ s:bg, s:green, 'bold' ], [ s:bg, s:brightyellow, 'bold' ] ]
let s:p.normal.error   = [ [ s:red2,   s:bg ] ]
let s:p.normal.warning = [ [ s:brightyellow, s:bg ] ]
let s:p.insert.right   = [ [ s:bg, s:blue, 'bold' ], [ s:bg, s:brightyellow, 'bold' ] ]
let s:p.replace.right  = [ [ s:bg, s:red1, 'bold' ], [ s:bg, s:brightyellow, 'bold' ] ]
let s:p.visual.right   = [ [ s:bg, s:yellow, 'bold' ], [ s:bg, s:brightyellow, 'bold' ] ]
let s:p.tabline.left   = [ [ s:bg, s:purple, 'italic' ] ]
let s:p.tabline.tabsel = [ [ s:bg, s:brightyellow, 'bold' ] ]
let s:p.tabline.middle = [ [ s:gray3, s:gray2 ] ]
let s:p.tabline.right  = [ [ s:bg, s:purple ] ]

let g:lightline#colorscheme#custom#palette = lightline#colorscheme#fill(s:p)

" use lightline-buffer in lightline
let g:lightline = {
	\ 'colorscheme': 'custom',
	\ 'active': {
	\   'left': [['mode', 'paste'], ['gitbranch', 'filename', 'readonlyormodified']],
	\   'right': [['percent', 'lineinfo'], ['fileformat', 'fileencoding', 'filetype'], ['linter_warnings', 'linter_errors', 'linter_ok'] ]
	\ },
	\ 'inactive': {
	\   'left': [['mode', 'paste'], ['gitbranch', 'filename', 'readonlyormodified']],
	\   'right': [['percent', 'lineinfo'], ['fileformat', 'fileencoding', 'filetype'], ]
	\ },
	\ 'tabline': {
	\ 'left': [ [ 'bufferinfo' ], [ 'bufferbefore', 'buffercurrent', 'bufferafter' ], ],
	\ 'right': [ [ 'date' ], ],
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
	\ 'readonlyormodified': 'UnicodeReadonlyOrModified',
	\ 'gitbranch': 'fugitive#head',
	\ 'date': 'DateForTabline'
	\ },
	\ }

function! DateForTabline() abort
	return strftime("%a, %b %e, %Y")
endfunction

function! UnicodeReadonlyOrModified()
	return &readonly ? '⦸' : (&modified ? '+' : '')
endfunction

function! LightlineLinterWarnings() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d %s', all_non_errors, g:ale_sign_warning)
endfunction
function! LightlineLinterErrors() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d %s', all_errors, g:ale_sign_error)
endfunction
function! LightlineLinterOK() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '✓' : ''
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
let g:lightline_buffer_logo = 'Vim '
let g:lightline_buffer_readonly_icon = '⦸'
let g:lightline_buffer_modified_icon = '+'
let g:lightline_buffer_git_icon = ''
let g:lightline_buffer_ellipsis_icon = '…'
let g:lightline_buffer_expand_left_icon = '◀'
let g:lightline_buffer_expand_right_icon = '▶'
let g:lightline_buffer_active_buffer_left_icon = ''
let g:lightline_buffer_active_buffer_right_icon = ''
let g:lightline_buffer_separator_icon = ' '


" lightline-buffer function settings
let g:lightline_buffer_show_bufnr = 1
let g:lightline_buffer_rotate = 0
let g:lightline_buffer_fname_mod = ':t'
let g:lightline_buffer_excludes = ['vimfiler']

let g:lightline_buffer_maxflen = 32
let g:lightline_buffer_maxfextlen = 4
let g:lightline_buffer_minflen = 8
let g:lightline_buffer_minfextlen = 3
let g:lightline_buffer_reservelen = 16

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
