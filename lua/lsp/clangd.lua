vim.lsp.config.clangd = {
    filetypes = { "c", "cpp", "objc", "objcpp", "cuda", },
    cmd = {
        -- see clangd --help-hidden
        "clangd",
        "--background-index",
        "--clang-tidy",
        "--all-scopes-completion",
        "--header-insertion-decorators",
        -- "--experimental-modules-support", -- this breaks the single file
        -- "--debug-modules-builder",
        -- "--log=verbose",
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
        fallbackFlags = { "-std=c++23", },
    },
    -- on_attach = function(client, bufn) client.server_capabilities.semanticTokensProvider = nil end,
    root_markers = { ".clangd", ".git", "compile_commands.json", },
    single_file_support = true,
}
vim.lsp.enable "clangd"

_G.bufferCopy = function(bufnr)
    local util = require "lspconfig.util"
    local winid = vim.fn.winnr()
    if winid == 1 then
        if vim.fn.win_getid(2) == 0 then
            bufnr = util.validate_bufnr(bufnr)
            vim.fn.execute "rightbelow vertical new"
        else
            bufnr = vim.fn.winbufnr(2)
        end
    else
        bufnr = vim.fn.winbufnr(1)
    end
    local clangd_client = util.get_active_client_by_name(bufnr, "clangd")
    local params = { uri = vim.uri_from_bufnr(bufnr), }
    if clangd_client then
        clangd_client.request("textDocument/switchSourceHeader", params, function(err, result)
            if err then
                error(tostring(err))
            end
            if not result then
                print "Corresponding file on the other window cannot be determined"
                return
            end
            vim.api.nvim_command("edit " .. vim.uri_to_fname(result))
        end, bufnr)
    else
        print "method textDocument/switchSourceHeader is not supported by any servers active on the buffer"
    end
end
