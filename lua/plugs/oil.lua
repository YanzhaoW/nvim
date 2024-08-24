require("oil").setup {
    delete_to_trash = true,
    keymaps = {
        ["<C-h>"] = false,
        ["<C-l>"] = false,
        ["<C-_>"] = { "actions.select", opts = { horizontal = true }, desc = "Open the entry in a horizontal split" },
    },
}
