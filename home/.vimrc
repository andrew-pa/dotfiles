set nocompatible
set encoding=utf-8

" load plugins
call plug#begin('~/.vim/plugins')
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'guns/vim-sexp'
Plug 'tpope/vim-sexp-mappings-for-regular-people'
Plug 'rust-lang/rust.vim'
Plug 'jeetsukumaran/vim-markology'
Plug 'jackguo380/vim-lsp-cxx-highlight'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Olical/conjure'
" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
call plug#end()

" display options
" set rop=type:directx,renmode:5
set guioptions=
" set guifont=Fira_Code_Medium:h11
colorscheme noctu
hi CursorLine ctermbg=187 cterm=none

if filereadable(expand("$VIMRUNTIME/gvimfullscreen.dll"))
    nnoremap <expr> <F11> libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)
endif

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

source ~/.vim/common.vim

imap <C-V> <C-R>*

tnoremap <Esc> <C-w>N
tnoremap <Esc><Space> <C-w>w

" Coc keybindings
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

nmap <silent> <Leader>[ <Plug>(coc-diagnostic-prev)
nmap <silent> <Leader>] <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Use <Leader>f to show documentation in preview window.
nnoremap <silent> <Leader>f :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

nmap <Leader>n <Plug>(coc-rename)
nmap <Leader>r <Plug>(coc-fix-current)
nmap <Leader>t <Plug>(coc-codeaction)
xmap <Leader>a <Plug>(coc-codeaction-selected)
nmap <Leader>a <Plug>(coc-codeaction-selected)
nmap <silent> <Leader>s :CocList symbols<CR>
nmap <silent> <Leader>o :CocList outline<CR>

xmap <Leader>= <Plug>(coc-format-selected)
nmap <Leader>= <Plug>(coc-format-selected)

nmap <Leader>S :CocCommand 

augroup cocgroup
    autocmd!
    autocmd FileType typescript,json,rust setl formatexpr=CocAction('formatSelected')
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Scroll popup windows
set belloff+=esc
nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"

" misc
if executable('powershell.exe')
    set shell=powershell.exe
endif

"statusline
set statusline=%<%f\ %q%h%m%r\ \ %#StatusLineNC#%{coc#status()}%*%=%-26.(%y\ ln\ %l\ col\ %v%)\ %P
set titlestring=vim\ [%F\ %P]
