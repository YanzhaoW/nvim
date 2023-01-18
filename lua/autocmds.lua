-- local gitsigns = require'gitsigns'

-- local function clangformat()
--     for _, value in ipairs(gitsigns.get_hunks()) do
--         local start = value.added.start
--         local count = value.added.count
--         pcall(vim.fn["clang_format#replace"], start, start + count)
--     end
-- end

-- local cppgroup = vim.api.nvim_create_augroup("c++ autocmd", {clear = true})

-- vim.api.nvim_create_autocmd(
--     {"BufWritePre"},
--     {
--         group = cppgroup,
--         callback = function(opts)
--             if vim.bo[opts.buf].filetype == "cpp" then
--                 clangformat()
--             end
--         end,
--     }
-- )

-- cmp:
local cmp_toggle = function()
    if vim.g.cmp_disable_enable_toggle == true then
        vim.g.cmp_disable_enable_toggle = false
        print('autocomplete is OFF')
    else
        vim.g.cmp_disable_enable_toggle = true
        print('autocomplete is ON')
    end
end

vim.api.nvim_buf_create_user_command(0, "CmpToggle", cmp_toggle, {})

vim.api.nvim_create_autocmd(
    {"filetype"},
    {
        pattern = "cpp, python, lua",
        callback = function(_)
            vim.g.cmp_disable_enable_toggle = true
        end
    }
)
