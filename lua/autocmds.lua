-- local gitsigns = require'gitsigns'

-- local function clangformat()
--     for _, value in ipairs(gitsigns.get_hunks()) do
--         local start = value.added.start
--         local count = value.added.count
--         pcall(vim.fn["clang_format#replace"], start, start + count)
--     end
-- end

-- local autoformat = vim.api.nvim_create_augroup("autoformat", { clear = true })

-- vim.api.nvim_create_autocmd(
--     { "BufWritePre" },
--     {
--         group = autoformat,
--         callback = function()
--             vim.lsp.buf.format({ async = false })
--         end,
--     }
-- )

-- cmp:
local cmp_toggle = function()
    if vim.g.cmp_disable_enable_toggle == true then
        vim.g.cmp_disable_enable_toggle = false
        print "autocomplete is OFF"
    else
        vim.g.cmp_disable_enable_toggle = true
        print "autocomplete is ON"
    end
end

-- vim.api.nvim_buf_create_user_command(0, "CmpToggle", cmp_toggle, {})
vim.api.nvim_create_user_command("CmpToggle", cmp_toggle, {})

vim.api.nvim_create_user_command("InlayToggle", function()
    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, {})

vim.api.nvim_create_autocmd({ "filetype", }, {
    pattern = {
        "cpp",
        "python",
        "lua",
        "cmake",
        "tex",
        "typescript",
        "javascript",
        "typescriptreact",
    },
    callback = function(event)
        vim.g.cmp_disable_enable_toggle = true
        -- make script
        if event.match == "cpp" or event.match == "c" or event.match == "tex" then
            vim.opt_local.makeprg = "cmake --build ./build --"
        elseif event.match == "cmake" then
            vim.opt_local.makeprg = "cmake -B ./build -S ."
        elseif event.match == "typescript" or event.match == "javascript" or event.match == "typescriptreact" then
            vim.opt_local.makeprg = "npm run build"
        else
        end
    end,
})

vim.api.nvim_create_autocmd({ "filetype", }, {
    pattern = {
        "cpp",
        "python",
        "lua",
        "cmake",
        "tex",
        "typescript",
        "javascript",
        "typescriptreact",
        "markdown",
    },
    callback = function(args)
        -- local nvim_ts = require("nvim-treesitter")
        -- local parsers = nvim_ts.get_installed()
        -- local filetype = args.match
        -- for _, parser in ipairs(parsers) do
        -- 	if filetype == parser then
        -- 		vim.treesitter.start()
        --               return true
        -- 	end
        -- end
        -- require("nvim-treesitter").install({ filetype })
        vim.treesitter.start()
    end,
})

vim.api.nvim_create_autocmd("ColorScheme",
    {
        callback = require "plugins.colorscheme".SetSemHi,
    })

vim.api.nvim_create_autocmd("QuitPre", {
    callback = function()
        local invalid_win = {}
        local wins = vim.api.nvim_list_wins()
        for _, w in ipairs(wins) do
            local bufname = vim.api.nvim_buf_get_name(vim.api
            .nvim_win_get_buf(w))
            if bufname:match "NvimTree_" ~= nil then
                table.insert(invalid_win, w)
            end
        end
        if #invalid_win == #wins - 1 then
            -- Should quit, so we close all invalid windows.
            for _, w in ipairs(invalid_win) do
                vim.api.nvim_win_close(w, true)
            end
        end
    end,
})

local my_augroup = vim.api.nvim_create_augroup("mygroup",
    {
        clear = true,
    })
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "text", "tex", "markdown", "rst", }, -- disable spellchecking for these filetypes
    -- command = "setlocal spell spelllang=en_us,de_de | set spellcapcheck= | syntax spell toplevel",
    command =
    "setlocal spell spelllang=en_us | set spellcapcheck= | syntax spell toplevel",
    group = my_augroup,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "rst", }, -- disable spellchecking for these filetypes
    callback = function()
        vim.opt_local.tabstop = 2
        vim.opt_local.shiftwidth = 2
        vim.opt_local.expandtab = true
        vim.bo.softtabstop = 2
    end,
    -- command = "setlocal spell spelllang=en_us,de_de | set spellcapcheck= | syntax spell toplevel",
    -- command = "setlocal spell spelllang=en_us | set spellcapcheck= | syntax spell toplevel",
    group = my_augroup,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "qf", }, -- disable spellchecking for these filetypes
    -- command = "setlocal spell spelllang=en_us,de_de | set spellcapcheck= | syntax spell toplevel",
    command = "wincmd L",
    group = my_augroup,
})

vim.api.nvim_create_autocmd("BufRead",
    {
        pattern = { "*.icc", },
        command = "setlocal filetype=cpp",
    })

vim.api.nvim_create_autocmd("BufRead",
    {
        pattern = { "*.mac", },
        command = "setlocal filetype=bash",
    })

vim.api.nvim_create_autocmd("User", {
    pattern = { "TelescopePreviewerLoaded", }, -- disable spellchecking for these filetypes
    command = "setlocal wrap",
    group = my_augroup,
})

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        local function buf_set_option(...)
            vim.api.nvim_buf_set_option(ev.buf, ...)
        end
        buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
        require "keymapping".lsp(client, ev.buf)
    end,
})

local spell_sync = function()
    print "syncing spell files...."
    vim.cmd "mkspell ~/.config/nvim/spell/en.utf-8.add"
end

vim.api.nvim_create_user_command("SpellSync", spell_sync, {})

vim.api.nvim_create_user_command("Gcb", function(branch)
    require "gitsigns".change_base(branch.args, true)
end, { nargs = 1, })

vim.api.nvim_create_user_command("Gdiff", function(branch)
    require "gitsigns".diffthis(branch.args)
end, { nargs = 1, })

local osc = vim.api.nvim_create_augroup("OSCYank", { clear = true, })
vim.api.nvim_create_autocmd({ "TextYankPost", }, {
    group = osc,
    callback = function()
        local event = vim.v.event
        if event.operator == "y" and event.regname == "" then
            require "osc52".copy_register '"'
        end
    end,
})

-- vim.api.nvim_create_augroup('AutoFormatting', { clear = true })
-- vim.api.nvim_create_autocmd('BufWritePre', {
--     group = 'AutoFormatting',
--     callback = function()
--         vim.lsp.buf.format({ async = false })
--     end,
-- })
