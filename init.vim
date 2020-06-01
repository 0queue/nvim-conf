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

" change for yaml
autocmd FileType yaml setlocal tabstop=2 shiftwidth=2

" change for ruby
autocmd FileType ruby setlocal tabstop=2 shiftwidth=2

" colors!
syntax on
set background=dark
set cursorline

" folding!
set foldmethod=syntax
set foldlevelstart=99

" recognize .zsh files
au BufNewFile,BufRead *.zsh-theme setlocal filetype=zsh

" recognize Vagrantfiles
au BufNewFile,BufRead Vagrantfile setlocal filetype=ruby

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

" open file to last location
autocmd BufReadPost *
    \ if @% !~ '\.tmp$' && @% !~ 'COMMIT_EDITMSG$' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

" better HTML
autocmd FileType html setlocal shiftwidth=2 tabstop=2

execute pathogen#infect('bundles/{}')

" bundle config
colorscheme base16-google-dark
highlight MatchParen gui=bold guifg=lightgray guibg=gray
set colorcolumn=80
let g:gutentags_enabled_user_func='GutentagsShouldEnable'

function! GutentagsShouldEnable(file)
    let path =  fnamemodify(a:file, ':p:h')
    try
        let gutentags_root = gutentags#get_project_root(path)
        if filereadable(gutentags_root . '/tags')
            return 1
        endif
    catch
    endtry

    return 0
endfunction

let g:raku_unicode_abbrevs = 1

" racer config
set hidden
let g:racer_cmd = $HOME . "/.cargo/bin/racer"
let $RUST_SRC_PATH = $HOME . "/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src"
" since double comma isn't too common
inoremap <Leader><Leader> <C-x><C-o> 
