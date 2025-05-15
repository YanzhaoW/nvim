local M = {}

M.setup = function()
	vim.lsp.config.yammls = {
		settings = {
			yaml = {
				format = {
					enable = true,
					singleQuote = true,
					printWidth = 75,
				},
				schemas = {
					["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
				},
			},
		},
	}
end

return M
