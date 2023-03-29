local actions = require("telescope.actions")
require('telescope').setup{
    defaults = {
        initial_mode ='insert'
    },
    pickers = {
        buffers = {
            mappings = {
                n = {["<leader>d"] = actions.delete_buffer},
            },
        },
    },
}

