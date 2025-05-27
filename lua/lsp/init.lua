local on_attach = require("plugs.lsp").on_attach
local capabilities = require("lsp.capability")

require("mason-lspconfig").setup({
	automatic_enable = true,
	ensure_installed = { "lua_ls", "yamlls", "cmake", "pyright" },
})

vim.lsp.config("*", {
	root_markers = { ".git" },
	capabilities = capabilities,
})

require("lsp.python").setup()
require("lsp.lua_ls").setup()
require("lsp.clangd").setup()
require("lsp.yamlls").setup()
require("lsp.cmake").setup()
vim.lsp.enable("clangd")
