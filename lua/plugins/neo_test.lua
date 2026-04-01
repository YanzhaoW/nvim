require "neotest".setup {
    adapters = {
        require "neotest-gtest".setup {
            debug_adapter = "lldb",
        },
        require "neotest-ctest".setup {},
    },
}

vim.diagnostic.config({
    virtual_text = {
        format = function(diagnostic)
            local message = diagnostic.message:gsub("[\r\n\t%s]+", " ")
            return message
        end,
    },
}, vim.api.nvim_create_namespace "neotest")
