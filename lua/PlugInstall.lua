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
    "tpope/vim-surround",
    "numToStr/comment.nvim",
    "nvim-tree/nvim-web-devicons",
    "nvim-lualine/lualine.nvim",
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        branch = "main",
        build = ":TSUpdate",
        opts = {
            ensure_installed = { "cmake", "cpp", "c", "lua", "markdown", "yaml", "python", "json", "rst" },
        },
    },
    "jacksonhvisuals/nvim-treesitter-cpp-tools",

    {
        "dstein64/vim-startuptime",
        lazy = true,
        cmd = { "StartupTime" },
    },
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
    },
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        build =
        "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
    },
    "nvim-telescope/telescope-file-browser.nvim",
    "ethanholz/nvim-lastplace",
    {
        "ojroques/nvim-osc52",
        opts = { max_length = 0, silent = true, trim = false },
    },

    --colorscheme:
    "navarasu/onedark.nvim",
    "rebelot/kanagawa.nvim",

    -- git plugins:
    "tpope/vim-fugitive",
    {
        "lewis6991/gitsigns.nvim",
        opts = { on_attach = require("keymapping").gitsigns },
    },

    -- lsp plugins
    "nvimtools/none-ls.nvim",

    {
        "williamboman/mason.nvim",
        opts = { PATH = "prepend" },
    },
    {
        "williamboman/mason-lspconfig.nvim",
    },
    "nvim-lua/lsp-status.nvim",
    "neovim/nvim-lspconfig",
    "tamago324/nlsp-settings.nvim",
    "stevearc/conform.nvim",
    "p00f/clangd_extensions.nvim",
    -- 'mfussenegger/nvim-lint',

    -- misc
    {
        "akinsho/git-conflict.nvim",
        opts = {},
        version = "*",
    },
    {
        "ahmedkhalf/project.nvim",
        opts = { detection_methods = { "pattern", "lsp" } },
        name = "project_nvim",
    },

    -- 'mhartington/formatter.nvim',
    -- 'simrat39/symbols-outline.nvim',
    { "enddeadroyal/symbols-outline.nvim", branch = "bugfix/symbol-hover-misplacement" },

    {
        "folke/trouble.nvim",
        opts = {},
        cmd = "Trouble",
        keys = require("keymapping").trouble(),
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },

    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {},
    },
    {
        "stevearc/oil.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },
    {
        "refractalize/oil-git-status.nvim",
        dependencies = {
            "stevearc/oil.nvim",
        },
    },

    --bufferline
    "romgrk/barbar.nvim",

    --snippet
    {
        "L3MON4D3/LuaSnip",
        -- follow latest release.
        version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        build = "make install_jsregexp",
        dependencies = {
            "rafamadriz/friendly-snippets",
            "benfowler/telescope-luasnip.nvim",
        },
        config = function(_, opts)
            if opts then
                require("luasnip").config.setup(opts)
            end
            vim.tbl_map(function(type)
                require("luasnip.loaders.from_" .. type).lazy_load()
            end, { "vscode", "snipmate", "lua" })
            -- friendly-snippets - enable standardized comments snippets
            require("luasnip").filetype_extend("typescript", { "tsdoc" })
            require("luasnip").filetype_extend("lua", { "luadoc" })
            require("luasnip").filetype_extend("python", { "pydoc" })
            require("luasnip").filetype_extend("cpp", { "cppdoc" })
            require("luasnip").filetype_extend("sh", { "shelldoc" })
        end,
    },

    -- "cmp
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/cmp-path",
            "saadparwaiz1/cmp_luasnip",
            "L3MON4D3/LuaSnip",
        },
    },
})
