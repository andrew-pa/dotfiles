set runtimepath^=~/config/nvim
let &packpath = &runtimepath
source ~/config/home/.vim/common.vim

set number
set title noshowmode hidden cursorline
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab
set linebreak breakindent
set completeopt=menuone,noselect
set fillchars=vert:\ 
set signcolumn=number
set updatetime=500

lua require('plugins')

set nohlsearch
augroup vimrc-incsearch-highlight
	autocmd!
	autocmd CmdlineEnter /,\? :set hlsearch
	autocmd CmdlineLeave /,\? :set nohlsearch
augroup END

set list
set listchars=tab:-->,trail:~,extends:>,precedes:<,space:·

set statusline=%<%f\ %q%h%m%r\ \ %*%=%-26.(%y\ ln\ %l\ col\ %v%)\ %P
set titlestring=vim\ [%F\ %P]

au FocusLost * silent! :wa

au FileType TelescopePrompt lua require('cmp').setup.buffer { enabled = false }
au FileType lisp,scheme,racket RainbowParentheses

if (exists("g:neovide") || (exists('$COLORTERM') && getenv('COLORTERM') == 'truecolor'))
    colorscheme tugui
else
    colorscheme noctu
endif

let g:neovide_cursor_animation_length=0.02
let g:neovide_cursor_animate_command_line=0
let g:neovide_floating_opacity=0.65
let g:neovide_hide_mouse_when_typing=1

nnoremap <Leader>[ :tabprevious<CR>
nnoremap <Leader>] :tabprevious<CR>
tnoremap <Esc> <C-\><C-n>


