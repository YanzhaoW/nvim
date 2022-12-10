local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    Packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
    -- My plugins here
    use 'wbthomason/packer.nvim'
    use 'tpope/vim-surround'
    use 'tpope/vim-fugitive'
    use 'lewis6991/gitsigns.nvim'
    use 'numToStr/comment.nvim'
    use 'kyazdani42/nvim-web-devicons'
    use 'nvim-lua/lsp-status.nvim'
    use 'nvim-lualine/lualine.nvim'
    use 'navarasu/onedark.nvim'
    -- use "akinsho/toggleterm.nvim"
    use 'nvim-treesitter/nvim-treesitter'
    use 'nvim-treesitter/playground'
    use {'rhysd/vim-clang-format', opt=true, ft = {'cpp', 'c'}}
    use {'dstein64/vim-startuptime', opt=true, cmd = {'StartupTime'}}
    use {'nvim-telescope/telescope.nvim', requires = { {'nvim-lua/plenary.nvim'} }}
    use {
        'kyazdani42/nvim-tree.lua',
        -- config = function() require'nvim-tree'.setup {} end
    }
    use 'ethanholz/nvim-lastplace'
    use 'rmagatti/auto-session'
    use 'rmagatti/session-lens'
    use {'karb94/neoscroll.nvim', config = function() require'neoscroll'.setup{} end}
    use 'ojroques/vim-oscyank'

    -- lsp plugins
    use 'neovim/nvim-lspconfig'
    use 'williamboman/nvim-lsp-installer'
    use 'tamago324/nlsp-settings.nvim'
    use 'ahmedkhalf/project.nvim'
    use {
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
    }

    --bufferline
    use 'romgrk/barbar.nvim'

    -- "cmp
    use {
        "hrsh7th/nvim-cmp",
        requires = {
            "hrsh7th/cmp-buffer", "hrsh7th/cmp-nvim-lsp", 'hrsh7th/cmp-cmdline', 'hrsh7th/cmp-path',
            'saadparwaiz1/cmp_luasnip', 'L3MON4D3/LuaSnip'
        }
    }

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins

    if Packer_bootstrap then
        require('packer').sync()
    end
end)


