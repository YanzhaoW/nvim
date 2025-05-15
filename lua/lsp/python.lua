local M = {}

M.setup = function()
	vim.lsp.config.pyright = {
		single_file_support = true,
	}
end
return M
