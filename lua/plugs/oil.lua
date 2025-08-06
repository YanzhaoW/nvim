require("oil").setup {
    delete_to_trash = true,
    keymaps = {
        ["<C-h>"] = false,
        ["<C-l>"] = false,
        ["<C-_>"] = { "actions.select", opts = { horizontal = true }, desc = "Open the entry in a horizontal split" },
    },
    view_options = {

        sort = {
            { "type", "asc" },
            { "name", "asc" }
        },
    },
    win_options = {
        signcolumn = "yes:2",
    },
}

require('oil-git-status').setup({
    show_ignored = true, -- show files that match gitignore with !!
    symbols = {          -- customize the symbols that appear in the git status columns
        index = {
            ["!"] = "!",
            ["?"] = "?",
            ["A"] = "A",
            ["C"] = "C",
            ["D"] = "D",
            ["M"] = "M",
            ["R"] = "R",
            ["T"] = "T",
            ["U"] = "U",
            [" "] = " ",
        },
        working_tree = {
            ["!"] = "!",
            ["?"] = "?",
            ["A"] = "A",
            ["C"] = "C",
            ["D"] = "D",
            ["M"] = "M",
            ["R"] = "R",
            ["T"] = "T",
            ["U"] = "U",
            [" "] = " ",
        },
    },
})
