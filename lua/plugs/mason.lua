require("mason").setup({
    PATH = "prepend",
})

require("mason-lspconfig").setup {
    ensure_installed = { "clangd", "lua_ls", "pylsp", "yamlls", "cmake" },
}
