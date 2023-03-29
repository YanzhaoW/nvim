local M = vim.lsp.protocol.make_client_capabilities()

M.window = M.window or {}
M.window.workDoneProgress = true

local cmp_tables = require('cmp_nvim_lsp').default_capabilities()
M.textDocument.completion = cmp_tables.textDocument.completion

return M
