require'bufferline'.setup{
    animation = true,
    auto_hide = true,
    clickable = true,
    tabpages= true,
    icon_pinned = '車',
}

--keybindings for barbar:
--jumping and reordering of buffers
map('n', '<leader>,', ':BufferPrevious<CR>')
map('n', '<leader>.', ':BufferNext<CR>')
map('n', '<leader><', ':BufferMovePrevious<CR>')
map('n', '<leader>>', ':BufferMoveNext<CR>')
-- Goto buffer in position
map('n', '<leader>1', ':BufferGoto 1<CR>')
map('n', '<leader>2', ':BufferGoto 2<CR>')
map('n', '<leader>3', ':BufferGoto 3<CR>')
map('n', '<leader>4', ':BufferGoto 4<CR>')
map('n', '<leader>5', ':BufferGoto 5<CR>')
map('n', '<leader>6', ':BufferGoto 6<CR>')
map('n', '<leader>7', ':BufferGoto 7<CR>')
map('n', '<leader>8', ':BufferGoto 8<CR>')
map('n', '<leader>9', ':BufferLast<CR>')
-- Pin/unpin buffer
map('n', '<leader>p', ':BufferPin<CR>')
-- Close buffer
map('n', '<leader>cc', ':BufferClose<CR>')

