local on_attach = require 'plugs.lsp'.on_attach
local capabilities = require("lsp.capability")

require("mason-lspconfig").setup_handlers {
    -- The first entry (without a key) will be the default handler
    -- and will be called for each installed server that doesn't have
    -- a dedicated handler.
    function(server_name) -- default handler (optional)
        require("lspconfig")[server_name].setup {
            on_attach = on_attach,
            capabilities = capabilities
        }
    end,
    ["pyright"] = require 'lsp.pyright'.setup,
    ["lua_ls"] = require 'lsp.lua_ls'.setup,
    ["clangd"] = require 'lsp.clangd'.setup,
    ["yamlls"] = require 'lsp.yammls'.setup,
    ["cmake"] = require 'lsp.cmake'.setup,
}
