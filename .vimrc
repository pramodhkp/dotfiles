execute pathogen#infect()

:syntax on
set tabstop=2
set shiftwidth=4
set expandtab
set smarttab
set smartindent
set number
set background=dark
set laststatus=2
set nocompatible
set encoding=utf-8 
set t_Co=256
let g:Powerline_symbols = 'fancy'
set cursorline
:hi CursorLine   cterm=bold term=bold ctermbg=8
set lcs=tab:>-,trail:.
set hlsearch
set incsearch
set list
set showcmd
filetype on
filetype plugin on

" Mappings
inoremap jj <Esc>
map j gj
map k gk
inoremap <s-tab> <C-n>
vnoremap <silent> <C-y> :w !xclip -selection c <CR>

" Useful tips
" g; - move through previous edit locations
" gi - insert mode with cursor at previous edit location
"

