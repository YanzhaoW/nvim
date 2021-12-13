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

call plug#begin('~/.config/nvim/plugged')
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'dpelle/vim-languagetool'
Plug 'tpope/vim-commentary'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
call plug#end()

"automatically deletes all trailing whitespace and newlines at end of file on
"save
autocmd BufWritePre * %s/\s\+$//e
set splitright

" color scheme:
" colorscheme nord
let g:airline_theme='night_owl'


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

" xmap gc  <Plug>VSCodeCommentary
" nmap gc  <Plug>VSCodeCommentary
" omap gc  <Plug>VSCodeCommentary
" nmap gcc <Plug>VSCodeCommentaryLine

"set languagetool
autocmd FileType text setlocal spell spelllang=en_us,de_de
autocmd FileType text set spellcapcheck=

" LSP language server
lua << EOF
require'lspconfig'.pyright.setup{}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
        vim.lsp.diagnostic.on_publish_diagnostics, {
                virtual_text = false
        }
)

do
        local method = "textDocument/publishDiagnostics"
        local default_handler = vim.lsp.handlers[method]
        vim.lsp.handlers[method] = function(err, method, result, client_id, bufnr, config)
                default_handler(err, method, result, client_id, bufnr, config)
                local diagnostics = vim.lsp.diagnostic.get_all()
                local qflist = {}
                for bufnr, diagnostic in pairs(diagnostics) do
                        for _, d in ipairs(diagnostic) do
                                d.bufnr = bufnr
                                d.lnum = d.range.start.line + 1
                                d.col = d.range.start.character + 1
                                d.text = d.message
                                table.insert(qflist, d)
                        end
                end
                vim.lsp.util.set_qflist(qflist)
        end
end

EOF

" Treesitter
lua << EOF
require'nvim-treesitter.configs'.setup{
        ensure_installed = "maintained",
        sync_install = false,
        highlight = {
                        enable = true,
                        additional_vim_regex_highlighting = false,
                },
}

EOF

