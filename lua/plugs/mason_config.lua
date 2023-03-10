require("mason").setup({
    PATH = "prepend",
})

require("mason-lspconfig").setup {
    ensure_installed = { "clangd", "cmake-langauge-server", "lua-language-server" },
}
