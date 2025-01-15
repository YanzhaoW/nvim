local actions = require("telescope.actions")
require('telescope').setup {
    defaults = {
        initial_mode = 'insert',
        preview = {
            treesitter = false,
        },
        file_ignore_patterns = {
            ".git/",
            "build/",
            ".cache/",
            "conan/",
            "node_modules/",
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
        live_grep = {
            additional_args = function()
                return { "--hidden" }
            end
        },
    },
}

if vim.fn.executable('rg') ~= 1 then
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
        }
    }
end
