set number
" set number relativenumber
syntax on
set expandtab
set incsearch
set nospell
set backspace=indent,eol,start
set scrolloff=4
set hidden
set cmdheight=1

set nocompatible
filetype off

"automatically deletes all trailing whitespace and newlines at end of file on
"save
autocmd BufWritePre * %s/\s\+$//e
set splitright

"set languagetool
autocmd FileType text setlocal spell spelllang=en_us,de_de
autocmd FileType text set spellcapcheck=

