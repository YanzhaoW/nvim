local actions = require("telescope.actions")
require('telescope').setup {
    defaults = {
        vimgrep_arguments = {
            "grep",
            "-b",
            "-I",
            "-n",
            "-R",
            "-E",
            "-i",
            "-s",
        },
        initial_mode = 'insert',
        file_ignore_patterns = {
            ".git/",
            "build/",
            ".cache/",
            "conan/",
        },
    },
    pickers = {
        buffers = {
            mappings = {
                n = { ["<leader>d"] = actions.delete_buffer },
            },
        },
        find_files = {
            hidden = true,
        },
    },
}
