vim.diagnostic.config({ virtual_text = false })

require 'lint'.linters.flake8.args = {
    '--format=%(path)s:%(row)d:%(col)d:%(code)s:%(text)s',
    '--no-show-source',
    '--max-line-length=200',
    '-', }

require('lint').linters_by_ft = {
    -- markdown = { 'vale', },
    -- python = { 'pylint', },
    python = { 'flake8', },
    cmake = { 'cmakelint' },
    -- cpp = { 'clang-tidy', },
}

-- require('lint.linters.pylint').args = {
--     '--disable=C0116,C0114',
-- }
