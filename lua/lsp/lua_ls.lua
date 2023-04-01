local M = {}
local capabilities = require("lsp.capability")
local nvim_lsp = require('lspconfig')
local on_attach = require 'plugs.lsp'.on_attach

M.setup = function()
    nvim_lsp.lua_ls.setup {
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
            -- capabilities = capabilities,
            Lua = {
                diagnostics = {
                    globals = { 'vim' }
                }
            },
        }
    }
end

return M
