local M = {}

M.on_attach = function(client, bufnr)
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
    -- local lsp_format_modifications = require "lsp-format-modifications"
    -- lsp_format_modifications.attach(client, bufnr, { format_on_save = true })
    -- client.resolved_capabilities.document_formatting = true
    -- Enable completion triggered by <c-x><c-o>
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
    -- if client.server_capabilities.inlayHintProvider then
    --     vim.g.inlay_hints_visible = true
    --     vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
    -- end
    require 'keymapping'.lsp(client, bufnr)
end



vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false,
        signs = true,
    }
)

_G.bufferCopy = function(bufnr)
    local util = require 'lspconfig.util'
    local winid = vim.fn.winnr()
    if winid == 1 then
        if vim.fn.win_getid(2) == 0 then
            bufnr = util.validate_bufnr(bufnr)
            vim.fn.execute("rightbelow vertical new")
        else
            bufnr = vim.fn.winbufnr(2)
        end
    else
        bufnr = vim.fn.winbufnr(1)
    end
    local clangd_client = util.get_active_client_by_name(bufnr, 'clangd')
    local params = { uri = vim.uri_from_bufnr(bufnr) }
    if clangd_client then
        clangd_client.request('textDocument/switchSourceHeader', params, function(err, result)
            if err then
                error(tostring(err))
            end
            if not result then
                print 'Corresponding file on the other window cannot be determined'
                return
            end
            vim.api.nvim_command('edit ' .. vim.uri_to_fname(result))
        end, bufnr)
    else
        print 'method textDocument/switchSourceHeader is not supported by any servers active on the buffer'
    end
end
-- require('lint')
vim.keymap.set('n', '<leader>o<Tab>', ':call v:lua.bufferCopy(0)<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>oo', ':ClangdSwitchSourceHeader<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>of', ':ClangdFormat<CR>', { noremap = true, silent = true })

return M
