local M = {}
local capabilities = require("lsp.capability")
local nvim_lsp = require('lspconfig')
local on_attach = require 'plugs.lsp'.on_attach


M.setup = function()
    nvim_lsp.cmake.setup {
        cmd = { "cmake-language-server" },
        filetypes = { "cmake" },
        init_options = {
            buildDirectory = "build",
        },
        single_file_support = true,
        on_attach = on_attach,
        root_dir = nvim_lsp.util.root_pattern('.clangd', '.git', 'compile_commands.json', '.cmake-format'),
        capabilities = capabilities,
    }
end
return M
