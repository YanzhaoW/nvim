set number
" set number relativenumber
set expandtab
set incsearch
set backspace=indent,eol,start
set scrolloff=4
set hidden
set cmdheight=1
set mouse+=a
set inccommand=nosplit

filetype plugin indent on

"automatically deletes all trailing whitespace and newlines at end of file on
"save
" autocmd BufWritePre * %s/\s\+$//e
set splitright

"disable whitespace trailing warning:
let g:airline#extensions#whitespace#enabled = 0

"set languagetool
autocmd FileType text,tex setlocal spell spelllang=en_us,de_de
autocmd FileType text,tex set spellcapcheck=
au BufNewFile,BufRead * syntax spell toplevel
