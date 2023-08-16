local M = {}
local capabilities = require("lsp.capability")
local nvim_lsp = require('lspconfig')
local on_attach = require 'plugs.lsp'.on_attach

M.setup = function()
    -- nvim_lsp.jedi_language_server.setup {
    --     single_file_support = true,
    -- }
    -- nvim_lsp.pylsp.setup {
    --     on_attach = on_attach,
    --     capabilities = capabilities,
    --     settings = {
    --         pylsp = {
    --             configurationSources = { 'pycodestyle', 'flake8', 'jedi' },
    --             plugins = {
    --                 pycodestyle = {
    --                     maxLineLength = 150,
    --                 },
    --                 pylint = {
    --                     enabled = true,
    --                     executable = 'pylint',
    --                     args = { '--disable=C0116,C0114' },
    --                     -- args = '--init-hook',
    --                 },
    --                 -- jedi = {
    --                 --     environment = 'python3',
    --                 -- },
    --                 -- jedi_completion = {
    --                 --     enabled = true,
    --                 --     fuzzy = true
    --                 -- },
    --             },
    --         },
    --     },
    --     single_file_support = true,
    -- }

    nvim_lsp.pyright.setup {
        on_attach = on_attach,
        capabilities = capabilities,
        single_file_support = true,
    }
end
return M
