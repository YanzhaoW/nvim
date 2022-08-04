require('lualine').setup {
    extensions = {},
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {}
    },
    options = {
        always_divide_middle = true,
        component_separators = {
            left = "",
            right = ""
        },
        disabled_filetypes = {},
        globalstatus = false,
        icons_enabled = true,
        section_separators = {
            left = "",
            right = ""
        },
        theme = "onedark"
    },
    sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { "filename" },
        -- lualine_c = {{"require'lsp-status'.status()"}},
        lualine_x = { "require'lsp-status'.status()", "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" }
    },
    tabline = {}
}



