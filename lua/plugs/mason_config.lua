require("mason").setup({
    PATH = "prepend",
})

require("mason-lspconfig").setup {
    ensure_installed = { "clangd", "cmake", "lua_ls", "pyright", "yamlls" },
}
