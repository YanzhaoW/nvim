require "hover".setup {
    init = function()
        -- Require providers
        require "hover.providers.lsp"
        require "hover.providers.gh"
        require "hover.providers.gh_user"
        -- require('hover.providers.jira')
        -- require('hover.providers.dap')
        require "hover.providers.fold_preview"
        -- require('hover.providers.diagnostic')
        -- require('hover.providers.man')
        -- require('hover.providers.dictionary')
        -- require('hover.providers.highlight')
    end,
    preview_opts = { border = "rounded", },
    title = false,
}

require "gitsigns".setup { preview_config = { relative = "cursor", border = "rounded", }, }

local builtin = require "statuscol.builtin"

require "statuscol".setup {
    segments = {
        { sign = { name = { "Dap.*", }, namespace = { "diagnostic", }, maxwidth = 1, auto = false, }, },
        { sign = {
            namespace = { "gitsigns", },
            colwidth = 1,
            auto = true,
            wrap = true,
        }, },
        -- { sign = { name = { "Dap.*", }, maxwidth = 1, auto = true, }, },
        { text = { builtin.lnumfunc, " ", },                                                          condition = { true, builtin.not_empty, }, sign = { maxwidth = 1, colwidth = 1, }, },
    },
}
