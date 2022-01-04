vim.cmd([[let g:nvim_tree_special_files = { }]])
require'nvim-tree'.setup{
    view = {
        side = 'right'
    },
    auto_close = true
}
