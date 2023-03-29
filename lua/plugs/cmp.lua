vim.opt.completeopt = { 'menuone', 'noinsert', 'noselect' }
-- Setup nvim-cmp.
local cmp = require 'cmp'

vim.g.cmp_disable_enable_toggle = false

cmp.setup({
    enabled = function()
        return vim.g.cmp_disable_enable_toggle
    end,
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        end,
    },
    mapping = cmp.mapping.preset.insert(require 'keymapping'.cmp()),
    -- Accept currently selected item. If none selected, `select` first item.
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' }, -- For luasnip users.
    }, {
        { name = 'buffer' },
        { name = 'treesitter' },
    }),
})

cmp.setup.cmdline {
    mapping = cmp.mapping.preset.cmdline({
    })
}
