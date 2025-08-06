local capabilities = require("lsp.capability")

require("mason-lspconfig").setup({
    automatic_enable = true,
    ensure_installed = { "lua_ls", "yamlls", "cmake", "pyright", "clangd", "esbonio", "ltex_plus", "cspell_ls", "fortls" },
})

vim.lsp.config("*", {
    root_markers = { ".git" },
    capabilities = capabilities,
})

require("lsp/ltex_plus")
require("lsp/cspell_ls")
require("lsp/lua_ls")
require("lsp/clangd")
require("lsp/yamlls")
require("lsp/cmake")
require("lsp/python")
require("lsp/fortls")

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = false,
    signs = true,
})
