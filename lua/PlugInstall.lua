local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- My plugins here
    'tpope/vim-surround',
    'numToStr/comment.nvim',
    'kyazdani42/nvim-web-devicons',
    'nvim-lualine/lualine.nvim',
    'nvim-treesitter/nvim-treesitter',
    'nvim-treesitter/playground',

    {
        'dstein64/vim-startuptime',
        lazy = true,
        cmd = { 'StartupTime' }
    },
    {
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        build =
        'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
    },
    "nvim-telescope/telescope-file-browser.nvim",
    'kyazdani42/nvim-tree.lua',
    'ethanholz/nvim-lastplace',
    'ojroques/nvim-osc52',

    --colorscheme:
    'navarasu/onedark.nvim',
    'rebelot/kanagawa.nvim',

    -- git plugins:
    'tpope/vim-fugitive',
    'lewis6991/gitsigns.nvim',
    {
        'akinsho/git-conflict.nvim',
        version = '*',
        config = function()
            require(
                'git-conflict').setup()
        end
    },

    -- lsp plugins
    "jose-elias-alvarez/null-ls.nvim",
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'nvim-lua/lsp-status.nvim',
    'neovim/nvim-lspconfig',
    'joechrisellis/lsp-format-modifications.nvim',
    'tamago324/nlsp-settings.nvim',
    -- 'mfussenegger/nvim-lint',

    -- misc
    'ahmedkhalf/project.nvim',
    -- 'simrat39/symbols-outline.nvim',
    { 'enddeadroyal/symbols-outline.nvim', branch = 'bugfix/symbol-hover-misplacement' },
    { 'folke/trouble.nvim',                dependencies = 'kyazdani42/nvim-web-devicons' },

    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {},
    },


    --bufferline
    'romgrk/barbar.nvim',

    --snippet
    {
        "L3MON4D3/LuaSnip",
        -- follow latest release.
        version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        build = "make install_jsregexp"
    },

    -- "cmp
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-buffer", "hrsh7th/cmp-nvim-lsp", 'hrsh7th/cmp-cmdline', 'hrsh7th/cmp-path',
            'saadparwaiz1/cmp_luasnip', 'L3MON4D3/LuaSnip'
        },
    },
})
