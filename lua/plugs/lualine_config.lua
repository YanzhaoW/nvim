
local function get_server_names()
    local server_names = {}
    local clients = vim.lsp.buf_get_clients()
    for _,value in pairs(clients) do
        table.insert(server_names, value.name)
    end
    return table.concat(server_names, ", ")
end



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
        lualine_b = { "branch", "diff",
            {
                'diagnostics',
                source = {'nvim_lsp'}
            } },
        lualine_c = { "filename" },
        -- lualine_c = {{"require'lsp-status'.status()"}},
        lualine_x = {get_server_names, "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" }
    },
    tabline = {}
}


