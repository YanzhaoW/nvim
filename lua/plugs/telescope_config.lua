local actions = require("telescope.actions")
require('telescope').setup{
    defaults = {
        initial_mode ='normal'
    },
    pickers = {
        buffers = {
            mappings = {
                n = {["<leader>d"] = actions.delete_buffer},
            },
        },
    },
    
}
