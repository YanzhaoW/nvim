vim.g.mapleader = " "

local function map(mode, lhs, rhs, opts)
    local options = {noremap = true, silent = true}
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map('t', '<Esc>', [[<C-\><C-n>]])

----insert mode keymapping:
map('i', 'jk', '<Esc>')

----visual mode keymapping:
-- search selected string
map('v', '*', [[y/\V<C-R>=escape(@",'/\')<CR><CR>]])

----normal mode keymapping:
map('n', '<C-h>', '<C-w>h')
map('n', '<C-l>', '<C-w>l')
map('n', '<leader>w', ':w<Enter>')
map('n', '<leader>q', ':q<Enter>')
map('n', '<leader>h', ':noh<Enter>')
-- moving one line down in text wrapping
map('n', 'j', [[v:count ? 'j' : 'gj']], {expr = true})
map('n', 'k', [[v:count ? 'k' : 'gk']], {expr = true})
--centering cursor when go to positions
map('n', 'n', 'nzz')
map('n', 'N', 'Nzz')
map('n', '*', '*zz')
map('n', '#', '#zz')
map('n', 'g*', 'g*zz')
map('n', 'g#', 'g#zz')
map('n', '<C-j>', '<C-e>')
map('n', '<C-k>', '<C-y>')

--keybindings for nvimtree:
map('n', '<C-x>', ':NvimTreeToggle<CR>')
map('n', '<leader>x', ':NvimTreeFocus<CR>')
map('i', '<C-x>', '<ESC>:NvimTreeToggle<CR>')
map('v', '<C-x>', '<ESC>:NvimTreeToggle<CR>')

--keybindings for telescope:
map('n', '<leader>ff', [[<cmd>lua require('telescope.builtin').find_files()<CR>]])
map('n', '<leader>fg', [[<cmd>lua require('telescope.builtin').live_grep()<CR>]])
map('n', '<leader>fb', [[<cmd>lua require('telescope.builtin').buffers()<CR>]])
-- map('n', '<leader>fe', [[<cmd>lua require('telescope.builtin').file_browser()<CR>]])
map('n', '<leader>fh', [[<cmd>lua require('telescope.builtin').help_tags()<CR>]])


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


-- keymapping for cmp:
_G.cmp_toggle = function()
    if vim.g.cmp_disable_enable_toggle == true then
        vim.g.cmp_disable_enable_toggle = false
        print('autocomplete is OFF')
    else
        vim.g.cmp_disable_enable_toggle = true
        print('autocomplete is ON')
    end
end

map('n', '<C-Space>', ':call v:lua.cmp_toggle()<CR>')
map('i', '<C-Space>', '<C-o>:call v:lua.cmp_toggle()<CR>')
