-- local null_ls = require "null-ls"

-- local sources = {
--     -- null_ls.builtins.diagnostics.pylint.with({
--     --     extra_args = { "--disable=C0116,C0115,C0114", "--max-line-length=120" }
--     -- }),
--     -- null_ls.builtins.diagnostics.cmake_lint.with({
--     -- }),
-- }
-- null_ls.setup({ sources = sources })

local lint = require 'lint'

lint.linters_by_ft = {
    -- markdown = {'vale'},
    cmake = { 'cmake_lint', },
    -- cpp = { 'cppcheck', },
}

lint.linters.cmake_lint.args = { "--disable", }

vim.api.nvim_create_autocmd({ "BufWritePost", }, {
    callback = function()
        -- try_lint without arguments runs the linters defined in `linters_by_ft`
        -- for the current filetype
        require "lint".try_lint()

        -- You can call `try_lint` with a linter name or a list of names to always
        -- run specific linters, independent of the `linters_by_ft` configuration
        -- require "lint".try_lint "cspell"
    end,
})

local cppcheck = require 'lint'.linters.cppcheck

cppcheck.append_fname = false
cppcheck.args = {
    "--enable=warning,style,performance,information",
    "--language=c++",
    "--inline-suppr",
    "--quiet",
    "--project=build/compile_commands.json",
    "--cppcheck-build-dir=build/.cppcheck-cache",
    "--output-format=sarif",
    -- "--output-file=cppcheck.sarif",
    -- "--template={file}:{line}:{column}: [{id}] {severity}: {message}",
}
cppcheck.stream = "stderr"
cppcheck.parser = require "lint.parser".for_sarif { source = "cppcheck", }
