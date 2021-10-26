set number relativenumber
syntax on
set expandtab
set incsearch
set nospell
set backspace=indent,eol,start
set scrolloff=4



set nocompatible
filetype off

call plug#begin('~/.config/nvim/plugged')
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/wombat256.vim'
Plug 'dpelle/vim-languagetool'
" Plug 'tpope/vim-commentary'
call plug#end()

"automatically deletes all trailing whitespace and newlines at end of file on
"save
autocmd BufWritePre * %s/\s\+$//e
set splitright

" color scheme:
colorscheme wombat256mod
let g:airline_theme='wombat'


" key mapping:
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

inoremap <C-k> <C-o>gk
inoremap <C-h> <Left>
inoremap <C-l> <Right>
inoremap <C-j> <C-o>gj

nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'

nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

xmap gc  <Plug>VSCodeCommentary
nmap gc  <Plug>VSCodeCommentary
omap gc  <Plug>VSCodeCommentary
nmap gcc <Plug>VSCodeCommentaryLine

"set languagetool
autocmd FileType text setlocal spell spelllang=en_us,de_de
autocmd FileType text set spellcapcheck=
