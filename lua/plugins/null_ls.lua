-- local null_ls = require "null-ls"

-- local sources = {
--     -- null_ls.builtins.diagnostics.pylint.with({
--     --     extra_args = { "--disable=C0116,C0115,C0114", "--max-line-length=120" }
--     -- }),
--     -- null_ls.builtins.diagnostics.cmake_lint.with({
--     -- }),
-- }
-- null_ls.setup({ sources = sources })


require 'lint'.linters_by_ft = {
    -- markdown = {'vale'},
    cmake = { 'cmake_lint', },
}

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
