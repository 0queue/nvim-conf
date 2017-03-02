" a simple neovim config

" makes the colors work
set termguicolors

filetype plugin indent on

set number
set ruler

" 4 spaces everywhere, probably should change for some languages
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent

" colors!
syntax on
set background=dark
set cursorline

" folding!
set foldmethod=syntax
set foldlevelstart=99

" recognize .zsh files
au BufNewFile,BufRead *.zsh-theme setlocal filetype=zsh

" for the integrated terminal
tnoremap <Esc> <C-\><C-n>

" disable mouse clicking
set mouse-=a

" pane navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
set splitright
set splitbelow

" leader key stuff
let mapleader=","
noremap <Leader>/ :nohlsearch<Enter>

execute pathogen#infect('bundles/{}')

" bundle config
colorscheme base16-google-dark
highlight MatchParen gui=bold guifg=lightgray guibg=gray
set colorcolumn=80

" racer config
set hidden
let g:racer_cmd = $HOME . "/.cargo/bin/racer"
let $RUST_SRC_PATH = $HOME . "/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src"
" since double comma isn't too common
inoremap <Leader><Leader> <C-x><C-o> 
