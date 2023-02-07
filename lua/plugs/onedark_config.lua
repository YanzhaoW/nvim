--theme:

require('onedark').setup {
    transparent = true,
    diagnostics = {
        undercurl = true
    },
    code_style = {
        comments = 'italic',
        keywords = 'italic,bold',
        functions = 'none',
        strings = 'none',
        variables = 'none'
    },
}

require('onedark').load()
