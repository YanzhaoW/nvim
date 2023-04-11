--theme:

-- require('onedark').setup {
--     transparent = true,
--     diagnostics = {
--         undercurl = true
--     },
--     code_style = {
--         comments = 'italic',
--         keywords = 'italic,bold',
--         functions = 'none',
--         strings = 'none',
--         variables = 'none'
--     },
-- }

-- require('onedark').load()

require("onedarkpro").setup({
    styles = {
        types = "NONE",
        methods = "NONE",
        numbers = "NONE",
        strings = "NONE",
        comments = "italic",
        keywords = "bold,italic",
        constants = "NONE",
        functions = "italic",
        operators = "NONE",
        variables = "NONE",
        parameters = "NONE",
        conditionals = "italic",
        virtual_text = "NONE",
    },
    options = {
        cursorline = true,
        transparency = true
    }
})

vim.cmd("colorscheme onedark_dark")
