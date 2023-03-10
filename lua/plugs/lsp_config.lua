local nvim_lsp = require('lspconfig')
-- local lsp_installer = require('nvim-lsp-installer')
local capabilities = require("lsp.capability")

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    local lsp_format_modifications = require "lsp-format-modifications"
    lsp_format_modifications.attach(client, bufnr, { format_on_save = false })
    -- Enable completion triggered by <c-x><c-o>
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    local opts = { noremap = true, silent = true, buffer = 0 }
    -- local opts = { buffer = 0 }

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    -- vim.keymap.set('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    -- vim.keymap.set('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    -- vim.keymap.set('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    -- vim.keymap.set('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', 'ga', vim.lsp.buf.code_action, opts)
    -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
    vim.keymap.set('n', '<space>l', vim.diagnostic.setloclist, opts)
    vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, opts)
end

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
    -- Next, you can provide a dedicated handler for specific servers.
    -- For example, a handler override for the `rust_analyzer`:
    ["pyright"] = function()
        nvim_lsp.pyright.setup {
            on_attach = on_attach,
            capabilities = capabilities,
            settings = {
                root_dir = nvim_lsp.util.root_pattern('.git'),
            }
        }
    end,
    ["lua_ls"] = function()
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
    end,

    ["clangd"] = function()
        nvim_lsp.clangd.setup {
            on_attach = on_attach,
            capabilities = capabilities,
            settings = {
                settings = require("lsp.clangd")
            }
        }
    end,
}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false,
        signs = false,
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
