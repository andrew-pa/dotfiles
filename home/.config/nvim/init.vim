set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

" if exists("g:neovide_refresh_rate")
    colorscheme tugui
" endif

set guifont=Fira\ Code:h22
let g:neovide_cursor_animation_length=0

let g:conjure#log#hug#width=0.6
let g:conjure#log#wrap=1
nnoremap <Leader>e :ConjureEval<Space>

