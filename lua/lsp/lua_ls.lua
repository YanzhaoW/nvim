local M = {}

M.setup = function()
	vim.lsp.config.lua_ls = {
		settings = {
			Lua = {
				diagnostics = {
					globals = { "vim" },
				},
			},
		},
	}
end

return M
