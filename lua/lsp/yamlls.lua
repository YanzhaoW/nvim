vim.lsp.config.yamlls = {
    filetypes = { "yaml" },
    cmd = { "yaml-language-server", "--stdio" },
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
vim.lsp.enable("yamlls")
