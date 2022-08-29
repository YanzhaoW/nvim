vim.g.mapleader = " "

function map(mode, lhs, rhs, opts)
    local options = {noremap = true, silent = true}
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map('t', '<Esc>', [[<C-\><C-n>]])

---- command keymapping:
vim.cmd('cnoremap <C-b> <Left>')
vim.cmd('cnoremap <C-f> <Right>')
vim.cmd('cnoremap <C-a> <Home>')
vim.cmd('cnoremap <C-e> <End>')

----insert mode keymapping:
map('i', 'jk', '<Esc>')

----visual mode keymapping:
map('v', 'J', 'j')
-- search selected string
map('v', '*', [[y/\V<C-R>=escape(@",'/\')<CR><CR>]])

----normal mode keymapping:

--unbind default keys:
map('n', 'J', 'j')

map('n', '<C-h>', '<C-w>h')
map('n', '<C-l>', '<C-w>l')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
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
map ('n', '<leader>bb', '<C-^>')



