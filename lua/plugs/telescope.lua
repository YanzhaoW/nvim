local actions = require("telescope.actions")
require('telescope').setup{
    defaults = {
        initial_mode = 'insert',
        file_ignore_patterns = {
            ".git",
        },
    },
    pickers = {
        buffers = {
            mappings = {
                n = {["<leader>d"] = actions.delete_buffer},
            },
        },
        find_files = {
            hidden = true,
        },
    },
}
