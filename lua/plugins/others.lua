require("hover").setup({
    init = function()
        -- Require providers
        require("hover.providers.lsp")
        require('hover.providers.gh')
        require('hover.providers.gh_user')
        -- require('hover.providers.jira')
        -- require('hover.providers.dap')
        require('hover.providers.fold_preview')
        -- require('hover.providers.diagnostic')
        -- require('hover.providers.man')
        -- require('hover.providers.dictionary')
        -- require('hover.providers.highlight')
    end,
    preview_opts = { border = "rounded", },
    title = false,
})

require('gitsigns').setup({
    preview_config = { relative = "cursor", border = "rounded", },
})
