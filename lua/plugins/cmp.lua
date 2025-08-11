vim.opt.completeopt = { "menuone", "noinsert", "noselect" }
-- Setup nvim-cmp.
local cmp = require("cmp")

vim.g.cmp_disable_enable_toggle = false

cmp.setup({
	enabled = function()
		return vim.g.cmp_disable_enable_toggle
	end,
	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
		end,
	},
	-- Accept currently selected item. If none selected, `select` first item.
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "luasnip" }, -- For luasnip users.
	}, {
		{ name = "buffer" },
		{ name = "treesitter" },
	}),
	sorting = {
		comparators = {
			cmp.config.compare.offset,
			cmp.config.compare.exact,
			cmp.config.compare.recently_used,
			require("clangd_extensions.cmp_scores"),
			cmp.config.compare.kind,
			cmp.config.compare.sort_text,
			cmp.config.compare.length,
			cmp.config.compare.order,
		},
	},
})

cmp.setup.cmdline({
	mapping = cmp.mapping.preset.cmdline({}),
})

require("luasnip.loaders.from_snipmate").lazy_load()
