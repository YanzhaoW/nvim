require('nvim_comment').setup({
    comment_empty = false
})

-- vim.cmd([[
-- augroup set_commentstring
-- autocmd!
-- autocmd FileType cpp :lua vim.api.nvim_buf_set_option(0, "commentstring", "// %s")
-- augroup END
-- ]])
