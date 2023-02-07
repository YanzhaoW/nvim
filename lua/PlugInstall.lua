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
    'wbthomason/packer.nvim',
    'tpope/vim-surround',
    'tpope/vim-fugitive',
    'lewis6991/gitsigns.nvim',
    'numToStr/comment.nvim',
    'kyazdani42/nvim-web-devicons',
    'nvim-lua/lsp-status.nvim',
    'nvim-lualine/lualine.nvim',
    'navarasu/onedark.nvim',
    -- "akinsho/toggleterm.nvim"
    'nvim-treesitter/nvim-treesitter',
    'nvim-treesitter/playground',

    -- {'rhysd/vim-clang-format', lazy=true, ft = {'cpp', 'c'}},
    { 'dstein64/vim-startuptime', lazy = true, cmd = { 'StartupTime' } },
    { 'nvim-telescope/telescope.nvim', dependencies = { 'nvim-lua/plenary.nvim' } },
    'kyazdani42/nvim-tree.lua',
    'ethanholz/nvim-lastplace',
    'rmagatti/auto-session',
    'rmagatti/session-lens',
    { 'karb94/neoscroll.nvim', config = function() require 'neoscroll'.setup {} end },
    'ojroques/vim-oscyank',

    -- lsp plugins
    'neovim/nvim-lspconfig',
    'williamboman/nvim-lsp-installer',
    'tamago324/nlsp-settings.nvim',
    'ahmedkhalf/project.nvim',
    { "folke/trouble.nvim", dependencies = "kyazdani42/nvim-web-devicons" },

    --bufferline
    'romgrk/barbar.nvim',

    -- "cmp
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-buffer", "hrsh7th/cmp-nvim-lsp", 'hrsh7th/cmp-cmdline', 'hrsh7th/cmp-path',
            'saadparwaiz1/cmp_luasnip', 'L3MON4D3/LuaSnip'
        },
    },
})
