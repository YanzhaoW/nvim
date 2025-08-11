local null_ls = require "null-ls"

local sources = {
    null_ls.builtins.diagnostics.pylint.with({
        extra_args = { "--disable=C0116,C0115,C0114", "--max-line-length=120" }
    }),
    null_ls.builtins.diagnostics.cmake_lint.with({
    }),
}
null_ls.setup({ sources = sources })
