require'nvim-treesitter.configs'.setup{
    ensure_installed = {"c", "cpp", "lua", "python", "cmake", "make", "markdown", "proto", "r"},
    auto_install = false,
    sync_install = false,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    incremental_selection = { enable = true },
    textobjects = { enable = true },
    indent = {
        enable = true,
        disable = {"python", "cpp", "c"},
    },
}
