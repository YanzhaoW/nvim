" LSP language server
lua << EOF
require'lspconfig'.pyright.setup{}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
        vim.lsp.diagnostic.on_publish_diagnostics, {
                virtual_text = false
        }
)

do
        local method = "textDocument/publishDiagnostics"
        local default_handler = vim.lsp.handlers[method]
        vim.lsp.handlers[method] = function(err, method, result, client_id, bufnr, config)
                default_handler(err, method, result, client_id, bufnr, config)
                local diagnostics = vim.lsp.diagnostic.get_all()
                local qflist = {}
                for bufnr, diagnostic in pairs(diagnostics) do
                        for _, d in ipairs(diagnostic) do
                                d.bufnr = bufnr
                                d.lnum = d.range.start.line + 1
                                d.col = d.range.start.character + 1
                                d.text = d.message
                                table.insert(qflist, d)
                        end
                end
                vim.lsp.util.set_qflist(qflist)
        end
end

EOF

