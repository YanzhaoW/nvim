require("snacks").setup({
	bigfile = { enabled = false },
	dashboard = { enabled = true },
	explorer = { enabled = false },
	indent = { enabled = false },
	input = { enabled = false },
	picker = { enabled = true },
	notifier = { enabled = false },
	quickfile = { enabled = false },
	scope = { enabled = false },
	scroll = { enabled = false },
	statuscolumn = {
		enabled = true,
		left = { "mark", "sign" }, -- priority of signs on the left (high to low)
		right = { "git" }, -- priority of signs on the right (high to low)
	},
	words = { enabled = false },
})
