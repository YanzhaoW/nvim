require("formatter").setup {
    logging = true,
    filetype = {
        cpp = {
            function()
                return {
                    exe = 'clang-format',
                    args = { '--style=file' },
                    stdin = true,
                }
            end
        },
        cmake = {
            function()
                return {
                    exe = "cmake-format",
                    args = { "-" },
                    stdin = true,
                }
            end
        },
    },
}
