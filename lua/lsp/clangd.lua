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
        cmd = {
            -- see clangd --help-hidden
            "clangd",
            "--background-index",
            "--clang-tidy",
            "--all-scopes-completion",
            "--header-insertion-decorators",
            "--experimental-modules-support",
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
            fallbackFlags = { '-std=c++23' },
        },
        root_dir = nvim_lsp.util.root_pattern('.clangd', '.git', 'compile_commands.json'),
        single_file_support = true,
    }
end

return M
