" a simple neovim config

let $NVIM_TUI_ENABLE_TRUE_COLOR=1

filetype plugin indent on

set number
set ruler

set tabstop=4
set shiftwidth=4
set expandtab
set autoindent

syntax on
set background=dark
colorscheme desert

tnoremap <Esc> <C-\><C-n>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

au BufRead,BufNewFile *.rs set filetype=rust

execute pathogen#infect('bundles/{}')
