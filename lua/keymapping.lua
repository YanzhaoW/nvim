local M = {}
vim.g.mapleader = " "

vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { noremap = true, silent = true })

---- command keymapping:
vim.keymap.set('c', '<C-b>', '<Left>', { noremap = true })
vim.keymap.set('c', '<C-f>', '<Right>', { noremap = true })
vim.keymap.set('c', '<C-a>', '<Home>', { noremap = true })
vim.keymap.set('c', '<C-e>', '<End>', { noremap = true })
----insert mode keymapping:
-- map('i', 'jk', '<Esc>')
-- vim.keymap.set('i', 'jk', '<Esc>', { noremap = true, silent = true })

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
-- vim.keymap.set('n', '<leader>w', ':w<Enter>', { noremap = true, silent = true })
-- vim.keymap.set('n', '<leader>q', ':q<Enter>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>*', ':noh<Enter>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>ll', 'g_', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>hh', '^', { noremap = true, silent = true })
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
vim.keymap.set('n', '<leader>fd', function() require('telescope.builtin').diagnostics({ bufnr = 0 }) end,
    { noremap = true, silent = true })
vim.keymap.set('n', '<leader>fh', function() require('telescope.builtin').help_tags() end,
    { noremap = true, silent = true })
vim.keymap.set('n', 'gr', function() require('telescope.builtin').lsp_references() end, { noremap = true, silent = true })

-- session
vim.keymap.set('n', '<leader>fs', ':SearchSession<CR>', { noremap = true, silent = true })

--keybindings for symbols:
vim.keymap.set('n', '<C-s>', ':SymbolsOutline<CR>', { noremap = true, silent = true })

--keybindings for nvimtree:
vim.keymap.set('n', '<C-t>', ':NvimTreeFocus<CR>', { noremap = true, silent = true })
-- vim.keymap.set('n', '<leader>x', ':NvimTreeFocus<CR>')
vim.keymap.set('i', '<C-t>', '<ESC>:NvimTreeFocus<CR>', { noremap = true, silent = true })
vim.keymap.set('v', '<C-t>', '<ESC>:NvimTreeFocus<CR>', { noremap = true, silent = true })

-- cmp
vim.keymap.set('n', 'tc', ':CmpToggle<CR>', { noremap = true, silent = true })

-- trouble:
vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>",
    { silent = true, noremap = true }
)
vim.keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>",
    { silent = true, noremap = true }
)
vim.keymap.set("n", "<C-x>", "<cmd>TroubleToggle document_diagnostics<cr>",
    { silent = true, noremap = true }
)
vim.keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>",
    { silent = true, noremap = true }
)
vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>",
    { silent = true, noremap = true }
)
vim.keymap.set("n", "gR", "<cmd>TroubleToggle lsp_references<cr>",
    { silent = true, noremap = true }
)

-- todo:
vim.keymap.set("n", "]t", function() require("todo-comments").jump_next() end,
    { noremap = true, silent = true, desc = "Next todo comment" })
vim.keymap.set("n", "[t", function() require("todo-comments").jump_prev() end,
    { noremap = true, silent = true, desc = "Previous todo comment" })


--lsp:
function M.lsp()
    local opts = { noremap = true, silent = true, buffer = 0 }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    -- vim.keymap.set('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    -- vim.keymap.set('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    -- vim.keymap.set('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    -- vim.keymap.set('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', 'ga', vim.lsp.buf.code_action, opts)
    -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
    vim.keymap.set('n', '<space>l', vim.diagnostic.setloclist, opts)
    vim.keymap.set('n', '<space>fm', function() vim.lsp.buf.format({ async = true }) end, opts)
end

function M.cmp()
    local cmp = require 'cmp'
    return {
        ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4)),
        ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4)),
        -- ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
        ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }
end

function M.nvimtree(bufnr)
    local api = require "nvim-tree.api"
    local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end
    -- default mappings
    api.config.mappings.default_on_attach(bufnr)
    -- custom mappings
    vim.keymap.set('n', '<C-t>', function() api.node.open.edit() end, opts('Ctrl-t'))
end

return M
