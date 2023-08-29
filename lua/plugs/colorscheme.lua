--theme:
local M = {}

require('onedark').setup {
    style = 'darker',
    transparent = true,
    diagnostics = {
        darker = true,
        undercurl = true
    },
    code_style = {
        comments = 'italic',
        keywords = 'italic,bold',
        functions = 'italic',
        strings = 'none',
        variables = 'none',
        conditionals = "italic",
    },
    lualine = {
        transparent = true,
    },
}

require('kanagawa').setup({
    compile = false,  -- enable compiling the colorscheme
    undercurl = true, -- enable undercurls
    commentStyle = { italic = true },
    functionStyle = {},
    keywordStyle = { italic = true },
    statementStyle = { bold = true },
    typeStyle = {},
    transparent = true,    -- do not set background color
    dimInactive = false,   -- dim inactive window `:h hl-NormalNC`
    terminalColors = true, -- define vim.g.terminal_color_{0,17}
    colors = {             -- add/modify theme and palette colors
        palette = {},
        theme = {
            all = {
                float = { bg = "none", },
                ui = { bg_gutter = "none", },
            }
        },
    },
    theme = "wave",    -- Load "wave" theme when 'background' option is not set
    background = {     -- map the value of 'background' option to a theme
        dark = "wave", -- try "dragon" !
        light = "lotus"
    },
})


M.SetSemHi = function()
    local links = {
        ['@lsp.type.namespace'] = '@namespace',
        ['@lsp.type.type'] = '@type',
        ['@lsp.type.class'] = '@type',
        ['@lsp.type.enum'] = '@type',
        ['@lsp.type.interface'] = '@type',
        ['@lsp.type.struct'] = '@structure',
        ['@lsp.type.parameter'] = '@parameter',
        ['@lsp.type.typeparameter'] = '@parameter',
        ['@lsp.type.variable'] = '@variable',
        ['@lsp.type.property'] = '@property',
        ['@lsp.type.enumMember'] = '@constant',
        ['@lsp.type.function'] = '@function',
        ['@lsp.type.method'] = '@method',
        ['@lsp.type.macro'] = '@macro',
        ['@lsp.type.decorator'] = '@function',
        ['@lsp.typemod.function.defaultLibrary'] = '@function.builtin',
        ['@lsp.typemod.method.defaultLibrary'] = '@function.builtin',
        ['@lsp.typemod.variable.defaultLibrary'] = '@variable.builtin',
    }
    -- for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
    --     print(group)
    --     vim.api.nvim_set_hl(0, group, {})
    -- end
    for newgroup, oldgroup in pairs(links) do
        vim.api.nvim_set_hl(0, newgroup, { link = oldgroup, default = true })
    end
    vim.api.nvim_set_hl(0, '@lsp.mod.readonly', { italic = true })
    -- vim.api.nvim_set_hl(0, '@lsp.typemod.function.classScope', { fg = 'Purple' })
    -- vim.api.nvim_set_hl(0, '@lsp.typemod.class.classScope', { fg = 'Purple' })
    -- vim.api.nvim_set_hl(0, '@lsp.typemod.variable.classScope', { fg = 'Purple' })
    -- vim.api.nvim_set_hl(0, '@lsp.typemod.variable.fileScope', { fg = 'Purple' })
    -- vim.api.nvim_set_hl(0, '@lsp.typemod.variable.globalScope', { fg = 'Purple' })
end

M.SetSemHi()

return M
