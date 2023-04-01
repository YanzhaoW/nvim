-- local handler = require("lsp.handler")
-- local attach = require("lsp.attach")
-- local capabilities = require("lsp.capability")
-- local clangd_ext_handler = require("lsp-status").extensions.clangd.setup()

local M = {}
local capabilities = require("lsp.capability")
local nvim_lsp = require('lspconfig')
local on_attach = require 'plugs.lsp'.on_attach

M.setup = function()
    nvim_lsp.clangd.setup {
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
            cmd = {
                -- see clangd --help-hidden
                "clangd",
                "--background-index",
                -- by default, clang-tidy use -checks=clang-diagnostic-*,clang-analyzer-*
                -- to add more checks, create .clang-tidy file in the root directory
                -- and add Checks key, see https://clang.llvm.org/extra/clang-tidy/
                "--clang-tidy",
                "--clang-tidy-checks=*",
                "--all-scopes-completion",
                -- "--completion-style=detailed",
                "--header-insertion-decorators",
                -- "--header-insertion=iwyu",
                "--pch-storage=memory",
                "--completion-style=bundled",
                "--cross-file-rename",
                "--header-insertion=iwyu",
            },
            init_options = {
                clangdFileStatus = true, -- Provides information about activity on clangd’s per-file worker thread
                usePlaceholders = true,
                completeUnimported = true,
                semanticHighlighting = true,
            },
            single_file_support = true,
        }
    }
end

return M
