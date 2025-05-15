local on_attach = require("plugs.lsp").on_attach
local capabilities = require("lsp.capability")

vim.lsp.config("*", {
	root_markers = { ".git" },
	capabilities = capabilities,
	on_attach = on_attach,
})

require("mason-lspconfig").setup({
	ensure_installed = { "clangd", "lua_ls", "yamlls", "cmake", "pyright" },
})

require("lsp.python").setup()
require("lsp.lua_ls").setup()
require("lsp.clangd").setup()
require("lsp.yamlls").setup()
require("lsp.cmake").setup()
