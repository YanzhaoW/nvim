" key mapping:
let mapleader=" "

tnoremap <Esc> <C-\><C-n>

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

"keymapping for barbar:
nnoremap <silent>    <leader>, :BufferPrevious<CR>
nnoremap <silent>    <leader>. :BufferNext<CR>
" Re-order to previous/next
nnoremap <silent>    <leader>< :BufferMovePrevious<CR>
nnoremap <silent>    <leader>> :BufferMoveNext<CR>
" Goto buffer in position...
nnoremap <silent>    <leader>1 :BufferGoto 1<CR>
nnoremap <silent>    <leader>2 :BufferGoto 2<CR>
nnoremap <silent>    <leader>3 :BufferGoto 3<CR>
nnoremap <silent>    <leader>4 :BufferGoto 4<CR>
nnoremap <silent>    <leader>5 :BufferGoto 5<CR>
nnoremap <silent>    <leader>6 :BufferGoto 6<CR>
nnoremap <silent>    <leader>7 :BufferGoto 7<CR>
nnoremap <silent>    <leader>8 :BufferGoto 8<CR>
nnoremap <silent>    <leader>9 :BufferLast<CR>
" Pin/unpin buffer
nnoremap <silent>    <leader>p :BufferPin<CR>
" Close buffer
nnoremap <silent>    <leader>cc :BufferClose<CR>

"keymapping for cmp:
function Cmp_toggle()
        if g:cmp_disable_enable_toggle is v:true
                let g:cmp_disable_enable_toggle = v:false
                :echom "autocomplete is OFF"
        else
                let g:cmp_disable_enable_toggle = v:true
                :echom "autocomplete is ON"
        endif
endfunction

nnoremap <silent> <expr> <C-Space> Cmp_toggle()
inoremap <silent> <C-Space> <C-o>:call Cmp_toggle()<CR>
