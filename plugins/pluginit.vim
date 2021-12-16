" install vim-plug if not exist
if empty(glob('~/.config/nvim/autoload/plug.vim'))
        silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin('~/.config/nvim/plugged')
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'dpelle/vim-languagetool'
Plug 'tpope/vim-commentary'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'joshdick/onedark.vim'

"lsp
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'tamago324/nlsp-settings.nvim'
Plug 'ahmedkhalf/project.nvim'

"bufferline
Plug 'kyazdani42/nvim-web-devicons'
Plug 'romgrk/barbar.nvim'

"cmp
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
call plug#end()

source $HOME/.config/nvim/plugins/onedark.vim
source $HOME/.config/nvim/plugins/treesitter.vim
source $HOME/.config/nvim/plugins/barbar.vim
source $HOME/.config/nvim/plugins/cmp.vim

luafile $HOME/.config/nvim/plugins/project.lua
luafile $HOME/.config/nvim/plugins/lsp.lua

