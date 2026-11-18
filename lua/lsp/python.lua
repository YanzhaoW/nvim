local function get_python_path()
    local conda_prefix = vim.env.CONDA_PREFIX
    if vim.env.CONDA_PREFIX and vim.env.CONDA_PREFIX ~= "" then
        -- print("setting python path to be " ..conda_prefix .. "/bin/python" )
        return conda_prefix .. "/bin/python"
    end

    local python = vim.fn.exepath "python"
    if python ~= "" then
        return python
    end

    return "python"
end

vim.lsp.config.pyright = {
    filetypes = { "python", },
    cmd = { "pyright-langserver", "--stdio", },
    settings = { pyright = { disableOrganizeImports = false, }, python = { pythonPath = get_python_path(), }, },
}

-- vim.lsp.enable("python")
vim.lsp.enable "pyright"
