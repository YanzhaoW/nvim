vim.opt.completeopt = {'menuone', 'noinsert', 'noselect'}
-- Setup nvim-cmp.
local cmp = require'cmp'

vim.g.cmp_disable_enable_toggle = false

cmp.setup({
        -- completion = {
        --         autocomplete = false,
        -- },
        enabled = function()
                return vim.g.cmp_disable_enable_toggle
        end,
        snippet = {
                -- REQUIRED - you must specify a snippet engine
                expand = function(args)
                        -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
                        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
                        -- require'snippy'.expand_snippet(args.body) -- For `snippy` users.
                end,
        },
        mapping = cmp.mapping.preset.insert({
                ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4)),
                ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4)),
                -- ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
                ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
                ['<C-e>'] = cmp.mapping.abort(),
                ['<CR>'] = cmp.mapping.confirm({ select = true }),
                }),
                -- Accept currently selected item. If none selected, `select` first item.
                -- Set `select` to `false` to only confirm explicitly selected items.
        sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                -- { name = 'vsnip' }, -- For vsnip users.
                { name = 'luasnip' }, -- For luasnip users.
                -- { name = 'ultisnips' }, -- For ultisnips users.
                -- { name = 'snippy' }, -- For snippy users.
        }, {
                { name = 'buffer' },
        })



})

cmp.setup.cmdline {
  mapping = cmp.mapping.preset.cmdline({
  })
}

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
-- require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
--     capabilities = capabilities
-- }
---- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
--cmp.setup.cmdline('/', {
--  sources = {
--    { name = 'buffer' }
--  }
--})

---- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
--cmp.setup.cmdline(':', {
--  sources = cmp.config.sources({
--    { name = 'path' }
--  }, {
--    { name = 'cmdline' }
--  })
--})
