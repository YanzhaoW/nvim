require("formatter").setup {
    logging = false,
    filetype = {
        cpp = {
            function()
                return {
                    exe = 'clang-format',
                    args = { '--style=file' },
                    stdin = true,
                }
            end
        }
    }
}
