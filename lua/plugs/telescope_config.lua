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

--keybindings for telescope:
map('n', '<leader>ff', [[<cmd>lua require('telescope.builtin').find_files()<CR>]])
map('n', '<leader>fg', [[<cmd>lua require('telescope.builtin').live_grep()<CR>]])
map('n', '<leader>fb', [[<cmd>lua require('telescope.builtin').buffers()<CR>]])
map('n', '<leader>fd', [[<cmd>lua require('telescope.builtin').diagnostics()<CR>]])
map('n', '<leader>fh', [[<cmd>lua require('telescope.builtin').help_tags()<CR>]])
map('n', '<leader>fs', ':SearchSession<CR>')
