local capabilities = require("lsp.capability")

require("mason-lspconfig").setup({
	automatic_enable = true,
	ensure_installed = { "lua_ls", "yamlls", "cmake", "pyright", "clangd" },
})

vim.lsp.config("*", {
	root_markers = { ".git" },
	capabilities = capabilities,
})

vim.lsp.enable("lua_ls")
vim.lsp.enable("yamlls")
vim.lsp.enable("clangd")
vim.lsp.enable("cmake")
vim.lsp.enable("python")

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	virtual_text = false,
	signs = true,
})

_G.bufferCopy = function(bufnr)
	local util = require("lspconfig.util")
	local winid = vim.fn.winnr()
	if winid == 1 then
		if vim.fn.win_getid(2) == 0 then
			bufnr = util.validate_bufnr(bufnr)
			vim.fn.execute("rightbelow vertical new")
		else
			bufnr = vim.fn.winbufnr(2)
		end
	else
		bufnr = vim.fn.winbufnr(1)
	end
	local clangd_client = util.get_active_client_by_name(bufnr, "clangd")
	local params = { uri = vim.uri_from_bufnr(bufnr) }
	if clangd_client then
		clangd_client.request("textDocument/switchSourceHeader", params, function(err, result)
			if err then
				error(tostring(err))
			end
			if not result then
				print("Corresponding file on the other window cannot be determined")
				return
			end
			vim.api.nvim_command("edit " .. vim.uri_to_fname(result))
		end, bufnr)
	else
		print("method textDocument/switchSourceHeader is not supported by any servers active on the buffer")
	end
end
-- require('lint')
