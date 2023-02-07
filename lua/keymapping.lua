vim.g.mapleader = " "

vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { noremap = true, silent = true })

---- command keymapping:
vim.keymap.set('c', '<C-b>', '<Left>', { noremap = true })
vim.keymap.set('c', '<C-f>', '<Right>', { noremap = true })
vim.keymap.set('c', '<C-a>', '<Home>', { noremap = true })
vim.keymap.set('c', '<C-e>', '<End>', { noremap = true })
----insert mode keymapping:
-- map('i', 'jk', '<Esc>')
vim.keymap.set('i', 'jk', '<Esc>', { noremap = true, silent = true })

----visual mode keymapping:
vim.keymap.set('v', 'J', 'j', { noremap = true, silent = true })
-- search selected string
vim.keymap.set('v', '*', [[y/\V<C-R>=escape(@",'/\')<CR><CR>]], { noremap = true, silent = true })

----normal mode keymapping:

--unbind default keys:
vim.keymap.set('n', 'J', 'j', { noremap = true, silent = true })

vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })
vim.keymap.set('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
vim.keymap.set('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>w', ':w<Enter>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>q', ':q<Enter>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>h', ':noh<Enter>', { noremap = true, silent = true })
-- moving one line down in text wrapping
vim.keymap.set('n', 'j', [[v:count ? 'j' : 'gj']], { noremap = true, silent = true, expr = true })
vim.keymap.set('n', 'k', [[v:count ? 'k' : 'gk']], { noremap = true, silent = true, expr = true })
--centering cursor when go to positions
vim.keymap.set('n', 'n', 'nzz', { noremap = true, silent = true })
vim.keymap.set('n', 'N', 'Nzz', { noremap = true, silent = true })
vim.keymap.set('n', '*', '*zz', { noremap = true, silent = true })
vim.keymap.set('n', '#', '#zz', { noremap = true, silent = true })
vim.keymap.set('n', 'g*', 'g*zz', { noremap = true, silent = true })
vim.keymap.set('n', 'g#', 'g#zz', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>bb', '<C-^>', { noremap = true, silent = true })


--keybindings for barbar:
--jumping and reordering of buffers
vim.keymap.set('n', '<leader>,', ':BufferPrevious<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>.', ':BufferNext<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader><', ':BufferMovePrevious<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>>', ':BufferMoveNext<CR>', { noremap = true, silent = true })
-- Goto buffer in position
vim.keymap.set('n', '<leader>1', ':BufferGoto 1<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>2', ':BufferGoto 2<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>3', ':BufferGoto 3<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>4', ':BufferGoto 4<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>5', ':BufferGoto 5<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>6', ':BufferGoto 6<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>7', ':BufferGoto 7<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>8', ':BufferGoto 8<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>9', ':BufferLast<CR>', { noremap = true, silent = true })
-- Pin/unpin buffer
vim.keymap.set('n', '<leader>p', ':BufferPin<CR>', { noremap = true, silent = true })
-- Close buffer
vim.keymap.set('n', '<leader>cc', ':BufferClose<CR>', { noremap = true, silent = true })

--keybindings for telescope:
vim.keymap.set('n', '<leader>ff', function() require('telescope.builtin').find_files() end,
    { noremap = true, silent = true })
vim.keymap.set('n', '<leader>fg', function() require('telescope.builtin').live_grep() end,
    { noremap = true, silent = true })
vim.keymap.set('n', '<leader>fb', function() require('telescope.builtin').buffers() end,
    { noremap = true, silent = true })
vim.keymap.set('n', '<leader>fd', function() require('telescope.builtin').diagnostics() end,
    { noremap = true, silent = true })
vim.keymap.set('n', '<leader>fh', function() require('telescope.builtin').help_tags() end,
    { noremap = true, silent = true })
vim.keymap.set('n', 'gr', function() require('telescope.builtin').lsp_references() end, { noremap = true, silent = true })

-- session
vim.keymap.set('n', '<leader>fs', ':SearchSession<CR>', { noremap = true, silent = true })


--keybindings for nvimtree:
vim.keymap.set('n', '<C-x>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
-- vim.keymap.set('n', '<leader>x', ':NvimTreeFocus<CR>')
vim.keymap.set('i', '<C-x>', '<ESC>:NvimTreeToggle<CR>', { noremap = true, silent = true })
vim.keymap.set('v', '<C-x>', '<ESC>:NvimTreeToggle<CR>', { noremap = true, silent = true })

-- cmp
vim.keymap.set('n', 'tc', ':CmpToggle<CR>', { noremap = true, silent = true })
