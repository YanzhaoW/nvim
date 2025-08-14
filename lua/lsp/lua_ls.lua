vim.lsp.config.lua_ls = {
    cmd = { "lua-language-server" },
    filetypes = { "lua" },
    settings = {
        Lua = {
            diagnostics = { globals = { "vim" }, },
            format = {
                enable = true,
                defaultConfig = {
                    max_line_length = "70",
                    auto_collapse_lines = "true",
                    break_all_list_when_line_exceed = "true",
                    line_space_after_if_statement = "keep",
                    call_arg_parentheses = "remove",
                    space_around_table_field_list = "true",
                    trailing_table_separator = "always",
                },
            }
        },
    },
}
vim.lsp.enable("lua_ls")
