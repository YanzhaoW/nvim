local M = {}
local capabilities = require("lsp.capability")
local nvim_lsp = require('lspconfig')
local on_attach = require 'plugs.lsp'.on_attach

M.setup = function()
    nvim_lsp.pyright.setup {
        on_attach = on_attach,
        capabilities = capabilities,
        -- settings = {
        --     root_dir = nvim_lsp.util.root_pattern('.git'),
        -- }
    }
end
return M
