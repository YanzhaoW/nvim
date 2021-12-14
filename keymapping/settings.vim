" key mapping:
let mapleader=" "
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

inoremap <C-k> <C-o>gk
inoremap <C-h> <Left>
inoremap <C-l> <Right>
inoremap <C-j> <C-o>gj
inoremap jk <Esc>

nnoremap <leader>w :w<Enter>
nnoremap <leader>q :q<Enter>
nnoremap <silent> <leader>h :noh<Enter>

nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'

nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz
nnoremap <C-j> <C-e>
nnoremap <C-k> <C-y>

vnoremap * y/\V<C-R>=escape(@",'/\')<CR><CR>
