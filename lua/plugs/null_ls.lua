local null_ls = require "null-ls"

local sources = {
    null_ls.builtins.formatting.black.with({
        extra_args = { "--line-length=120" }
    }),
    -- null_ls.builtins.diagnostics.cppcheck.with({
    --     --     -- extra_args = { "--project=compile_commands.json" },
    --     --     -- args = { "--project=compile_commands.json", "--enable=warning,style,performance,portability", "--template=gcc", },
    --     args = {
    --         "--language=c++",
    --         "--enable=warning,style,performance,portability",
    --         "--template=gcc",
    --         "--suppress=unusedStructMember",
    --         "$FILENAME",
    --     },
    -- }),
    null_ls.builtins.diagnostics.pylint.with({
        extra_args = { "--disable=C0116,C0115,C0114", "--max-line-length=120" }
    }),
    null_ls.builtins.formatting.isort,
    null_ls.builtins.formatting.latexindent,
    null_ls.builtins.diagnostics.cmake_lint.with({
    }),
}
null_ls.setup({ sources = sources })
