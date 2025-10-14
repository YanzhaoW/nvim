require("snacks").setup({
	bigfile = { enabled = true },
	dashboard = { enabled = true },
	explorer = { enabled = false },
	indent = { enabled = false },
	input = { enabled = false },
	picker = { enabled = true },
	notifier = { enabled = false },
	quickfile = { enabled = false },
	scope = { enabled = false },
	scroll = { enabled = false },
	-- statuscolumn = {
	--     enabled = true,
	--     left = { "mark", "sign" }, -- priority of signs on the left (high to low)
	--     -- right = { "git" },         -- priority of signs on the right (high to low)
	--     right = "git",         -- priority of signs on the right (high to low)
	-- },
	statuscolumn = { enabled = false },
	words = { enabled = false },
})

-- local Snacks = require("snacks")
-- local keybindings = require("keymapping").snacks_keybindings()

-- for _, keymap in ipairs(keybindings) do
--     vim.keymap.set("n", keymap[1], keymap[2], { noremap = true, silent = true })
-- end

-- vim.keymap.set("n", "<leader><space>", function() Snacks.picker.smart() end, { noremap = true, silent = true })
