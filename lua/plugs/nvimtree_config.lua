-- vim.cmd([[highlight IconNameDevicon guifg='<color>' ctermfg='<cterm_color>']])
require("nvim-web-devicons").setup {
    override = {
        C = {
            icon = "",
            color = "#13cf2f",
            -- cterm_color = "",
            name = "C"
        }
    };
    default = true;
}

require 'nvim-tree'.setup {
    view = {
        side = 'right'
    },
    respect_buf_cwd = true,
    update_cwd = true,
    hijack_directories = {
        auto_open = false,
    },
    update_focused_file = {
        enable = true,
        update_cwd = true,
        ignore_list = {},
    },
    git = {
        ignore = false,
    },
}

local modifiedBufs = function(bufs)
    local t = 0
    for k, v in pairs(bufs) do
        if v.name:match("NvimTree_") == nil then
            t = t + 1
        end
    end
    return t
end

vim.api.nvim_create_autocmd("BufEnter", {
    nested = true,
    callback = function()
        if #vim.api.nvim_list_wins() == 1 and
            vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil and
            modifiedBufs(vim.fn.getbufinfo({ bufmodified = 1 })) == 0 then
            vim.cmd "quit"
        end
    end
})
