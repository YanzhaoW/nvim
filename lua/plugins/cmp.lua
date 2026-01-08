vim.opt.completeopt = { "menuone", "noinsert", "noselect", }
-- Setup nvim-cmp.
local cmp = require "cmp"

vim.g.cmp_disable_enable_toggle = false

cmp.setup {
    enabled = function()
        return vim.g.cmp_disable_enable_toggle
    end,
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            require "luasnip".lsp_expand(args.body) -- For `luasnip` users.
        end,
    },
    -- Accept currently selected item. If none selected, `select` first item.
    sources = cmp.config.sources({
        { name = "nvim_lsp", },
        { name = "luasnip", }, -- For luasnip users.
    }, { { name = "buffer", }, { name = "treesitter", }, }),
    sorting = {
        comparators = {
            cmp.config.compare.offset,
            cmp.config.compare.exact,
            cmp.config.compare.recently_used,
            -- require "clangd_extensions.cmp_scores",
            cmp.config.compare.kind,
            cmp.config.compare.sort_text,
            cmp.config.compare.length,
            cmp.config.compare.order,
        },
    },
    mapping = {
        ['<CR>'] = cmp.mapping.confirm { select = true, },
        ['<C-n>'] = cmp.mapping {
            c = function()
                if cmp.visible() then
                    cmp.select_next_item {
                        behavior = cmp.SelectBehavior.Insert,
                    }
                else
                    vim.api.nvim_feedkeys(t '<Down>', 'n', true)
                end
            end,
            i = function(fallback)
                if cmp.visible() then
                    cmp.select_next_item {
                        behavior = cmp.SelectBehavior.Insert,
                    }
                else
                    fallback()
                end
            end,
        },
        ['<C-p>'] = cmp.mapping {
            c = function()
                if cmp.visible() then
                    cmp.select_prev_item {
                        behavior = cmp.SelectBehavior.Insert,
                    }
                else
                    vim.api.nvim_feedkeys(t '<Up>', 'n', true)
                end
            end,
            i = function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item {
                        behavior = cmp.SelectBehavior.Insert,
                    }
                else
                    fallback()
                end
            end,
        },
        ['<C-e>'] = cmp.mapping {
            i = cmp.mapping.close(),
            c = cmp.mapping.close(),
        },
    },
}


-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?', }, {
    enabled = false,
    mapping = cmp.mapping.preset.cmdline(),
    sources = { { name = 'buffer', }, },
})


cmp.setup.cmdline(':', {
    enabled = false,
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({ { name = 'path', }, },
        { {
            name = 'cmdline',
        }, }),
    matching = { disallow_symbol_nonprefix_matching = false, },
})

require "luasnip.loaders.from_snipmate".lazy_load()
