local function get_server_names()
    local server_names = {}
    local clients = vim.lsp.buf_get_clients()
    for _, value in pairs(clients) do
        table.insert(server_names, value.name)
    end
    return table.concat(server_names, ", ")
end

local trouble = require "trouble"
local symbols = trouble.statusline {
    mode = "lsp_document_symbols",
    groups = {},
    title = false,
    filter = { range = true, },
    format = "{kind_icon}{symbol.name:Normal}",
    -- The following line is needed to fix the background color
    -- Set it to the lualine section you want to use
    hl_group = "lualine_c_normal",
}

local narrow_window_condition = function()
    return vim.api.nvim_win_get_width(0) > 200
end

local gruvbox_theme = require'lualine.themes.gruvbox'
gruvbox_theme.insert.c.bg = '#3C3836'
gruvbox_theme.insert.c.fg = '#A89984'

require 'lualine'.setup {
    extensions = {},
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename", },
        lualine_x = { "location", },
        lualine_y = {},
        lualine_z = {},
    },
    options = {
        always_divide_middle = true,
        component_separators = {
            left = "",
            right = "",
        },
        disabled_filetypes = {},
        globalstatus = false,
        icons_enabled = true,
        section_separators = {
            left = "",
            right = "",
        },
        theme = "gruvbox",
    },
    sections = {
        lualine_a = { "mode", },
        lualine_b = { "branch", "diff",
            {
                'diagnostics',
                source = { 'nvim_lsp', },
                sections = { "error", "warn", "info", "hint", },
                symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ', },
                colored = true,
                update_in_insert = true,
            }, },
        lualine_c = { "filename", },
        -- lualine_c = { "filename" --[[ { symbols.get, cond = narrow_window_condition, }, ]]  },
        -- lualine_c = {{"require'lsp-status'.status()"}},
        -- lualine_x = { get_server_names, "encoding", "fileformat", "filetype" },
        -- lualine_x = { get_server_names, "filetype" },
        lualine_x = {
            {
                'lsp_status',
                icon = '', -- f013
                symbols = {
                    -- -- Standard unicode symbols to cycle through for LSP progress:
                    -- spinner = { '⠋', '⠙', '⠹', '⠸', '⠼', '⠴', '⠦', '⠧', '⠇', '⠏' },
                    spinner = {},
                    -- -- Standard unicode symbol for when LSP is done:
                    -- done = '✓',
                    done = '',
                    -- Delimiter inserted between LSP names:
                    separator = ' ',
                },
                -- List of LSP names to ignore (e.g., `null-ls`):
                ignore_lsp = { "null-ls", },
            },
            "filetype",
        },
        lualine_y = { { "progress", cond = narrow_window_condition, }, },
        lualine_z = { { "location", cond = narrow_window_condition, }, },
    },
    tabline = {},
}
