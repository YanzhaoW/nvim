require 'Comment'.setup {
    ignore = '^$',
    pre_hook = function()
        return vim.bo.commentstring
    end,
}

-- vim.cmd([[
-- augroup set_commentstring
-- autocmd!
-- autocmd FileType cpp :lua vim.api.nvim_buf_set_option(0, "commentstring", "// %s")
-- augroup END
-- ]])
