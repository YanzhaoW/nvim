local M = {}
local capabilities = require("lsp.capability")
local nvim_lsp = require('lspconfig')
local on_attach = require 'plugs.lsp'.on_attach

M.setup = function()
    nvim_lsp.yamlls.setup {
        on_attach = on_attach,
        capabilities = capabilities,
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
            }
        }
    }
end

return M
