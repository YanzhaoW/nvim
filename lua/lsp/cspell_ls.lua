local cspell_file = vim.fn.stdpath("config") .. "/spell/cspell.json"
vim.lsp.config.cspell_ls = {
    cmd = { 'cspell-lsp', '--stdio', '--config', cspell_file },
    filetypes = { "cpp", "python" }

}

vim.lsp.enable("cspell_ls")
