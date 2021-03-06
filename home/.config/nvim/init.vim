set runtimepath^=~/config/nvim
let &packpath = &runtimepath
source ~/config/home/.vim/common.vim

lua require('plugins')

set number relativenumber
set title noshowmode hidden cursorline
set softtabstop=4 shiftwidth=4 expandtab
set linebreak breakindent
set completeopt=menuone,noselect

set nohlsearch
augroup vimrc-incsearch-highlight
	autocmd!
	autocmd CmdlineEnter /,\? :set hlsearch
	autocmd CmdlineLeave /,\? :set nohlsearch
augroup END

set list
set listchars=tab:––→,trail:~,extends:>,precedes:<,space:·


set statusline=%<%f\ %q%h%m%r\ \ %*%=%-26.(%y\ ln\ %l\ col\ %v%)\ %P
set titlestring=vim\ [%F\ %P]

au FocusLost * silent! :wa

au BufEnter *.rs silent! :RustSetInlayHints
au FileType TelescopePrompt silent! call compe#setup({'enabled': v:false}, 0)

if exists('g:neovide')
    colorscheme tugui
else
    colorscheme noctu
endif

set guifont=Fira\ Code:h22
let g:neovide_cursor_animation_length=0.02
let g:neovide_cursor_animate_command_line=0

