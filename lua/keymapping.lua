local M = {}

vim.keymap.set("t", "<Esc>", "<C-\\><C-n>",
    { noremap = true, silent = true, })

---- command keymapping:
vim.keymap.set("c", "<C-b>", "<Left>", { noremap = true, })
vim.keymap.set("c", "<C-f>", "<Right>", { noremap = true, })
vim.keymap.set("c", "<C-a>", "<Home>", { noremap = true, })
vim.keymap.set("c", "<C-e>", "<End>", { noremap = true, })
----insert mode keymapping:
-- map('i', 'jk', '<Esc>')
-- vim.keymap.set('i', 'jk', '<Esc>', { noremap = true, silent = true })

----visual mode keymapping:
vim.keymap.set("v", "J", "j", { noremap = true, silent = true, })
-- search selected string
vim.keymap.set("v", "*", [[y/\V<C-R>=escape(@",'/\')<CR><CR>]],
    { noremap = true, silent = true, })

----normal mode keymapping:

--unbind default keys:
vim.keymap.set("n", "J", "j", { noremap = true, silent = true, })
vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap = true, silent = true, })
vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true, silent = true, })
vim.keymap.set("n", "<C-j>", "<C-w>j", { noremap = true, silent = true, })
vim.keymap.set("n", "<C-k>", "<C-w>k", { noremap = true, silent = true, })
vim.keymap.set("n", "<C-Left>", "2<C-w>>", { noremap = true, silent = true, })
vim.keymap.set("n", "<C-Right>", "2<C-w><", { noremap = true, silent = true, })
vim.keymap.set("n", "<C-Up>", "<C-w>+", { noremap = true, silent = true, })
vim.keymap.set("n", "<C-Down>", "<C-w>-", { noremap = true, silent = true, })
vim.keymap.set("n", "<leader>*", ":noh<Enter>", { noremap = true, silent = true, })
vim.keymap.set("n", "<leader>ll", "g_", { noremap = true, silent = true, })

vim.keymap.set("n", "j", [[v:count ? 'j' : 'gj']], { noremap = true, silent = true, expr = true, })
vim.keymap.set("n", "k", [[v:count ? 'k' : 'gk']], { noremap = true, silent = true, expr = true, })
-- moving one line down in text wrapping
-- vim.keymap.set('n', '<leader>w', ':w<Enter>', { noremap = true, silent = true })
-- vim.keymap.set('n', '<leader>q', ':q<Enter>', { noremap = true, silent = true })
-- vim.keymap.set("n", "n", "nzz", { noremap = true, silent = true, })
-- vim.keymap.set("n", "N", "Nzz", { noremap = true, silent = true, })
-- vim.keymap.set("n", "*", "*zz", { noremap = true, silent = true, })
-- vim.keymap.set("n", "#", "#zz", { noremap = true, silent = true, })
-- vim.keymap.set("n", "g*", "g*zz", { noremap = true, silent = true, })
-- vim.keymap.set("n", "g#", "g#zz", { noremap = true, silent = true, })
-- vim.keymap.set("n", "<C-o>", "<C-o>zz",
--     { noremap = true, silent = true, })

--centering cursor when go to positions
local native_key_binings = { "n", "N", "*", "#", "g*", "g#", "<C-o>", "<Tab>", }
for _, key_bind in ipairs(native_key_binings) do
    vim.keymap.set("n", key_bind, key_bind .. "zz",
        { noremap = true, silent = true, })
end


vim.keymap.set("n", "<leader>bb", "<C-^>",
    { noremap = true, silent = true, })

--keybindings for barbar:
--jumping and reordering of buffers
M.barbar = function()
    return {
        -- Goto buffer in position
        { "<leader>1",  ":BufferGoto 1<CR>",       { desc = "Go to buffer 1", }, },
        { "<leader>2",  ":BufferGoto 2<CR>",       { desc = "Go to buffer 2", }, },
        { "<leader>3",  ":BufferGoto 3<CR>",       { desc = "Go to buffer 3", }, },
        { "<leader>4",  ":BufferGoto 4<CR>",       { desc = "Go to buffer 4", }, },
        { "<leader>5",  ":BufferGoto 5<CR>",       { desc = "Go to buffer 5", }, },
        { "<leader>6",  ":BufferGoto 6<CR>",       { desc = "Go to buffer 6", }, },
        { "<leader>7",  ":BufferGoto 7<CR>",       { desc = "Go to buffer 7", }, },
        { "<leader>8",  ":BufferGoto 8<CR>",       { desc = "Go to buffer 8", }, },
        { "<leader>9",  ":BufferLast<CR>",         { desc = "Go to last buffer", }, },
        { "<leader>,",  ":BufferPrevious<CR>",     { desc = "Go to the previous buffer", }, },
        { "<leader>.",  ":BufferNext<CR>",         { desc = "Go to the next buffer", }, },
        { "<leader>bp", ":BufferPin<CR>",          { desc = "Pin the current buffer", }, },
        -- Close buffer
        { "<leader>cc", ":BufferClose<CR>",        { desc = "Close the current buffer", }, },
        { "<leader><",  ":BufferMovePrevious<CR>", { desc = "Move current buffer to the previous buffer", }, },
        { "<leader>>",  ":BufferMoveNext<CR>",     { desc = "Move current buffer to the next buffer", }, },
    }
end

--keybydings for snacks:

function M.snacks()
    local Snacks = require "snacks"
    return {
        -- Top Pickers & Explorer
        {
            "<leader><space>",
            function() Snacks.picker.smart { multi = { { source = "files", hidden = true, }, }, } end,
            desc = "Smart Find Files",
        },
        -- { "<leader>,",       function() Snacks.picker.buffers() end,                                 desc = "Buffers" },
        { "<leader>:",  function() Snacks.picker.command_history() end,                                   desc = "Command History", },
        { "<leader>n",  function() Snacks.picker.notifications() end,                                     desc = "Notification History", },
        { "<leader>/",  function() Snacks.picker.grep { hidden = true, } end,                             desc = "Grep", },
        { "<leader>fe", function() Snacks.explorer() end,                                                 desc = "File Explorer", },
        -- find
        { "<leader>fb", function() Snacks.picker.buffers() end,                                           desc = "Buffers", },
        { "<leader>ff", function() Snacks.picker.files() end,                                             desc = "Find Files", },
        { "<leader>fg", function() Snacks.picker.git_files() end,                                         desc = "Find Git Files", },
        { "<leader>fp", function() Snacks.picker.projects() end,                                          desc = "Projects", },
        { "<leader>fr", function() Snacks.picker.recent() end,                                            desc = "Recent", },
        -- git
        { "<leader>gb", function() Snacks.picker.git_branches() end,                                      desc = "Git Branches", },
        { "<leader>gl", function() Snacks.picker.git_log() end,                                           desc = "Git Log", },
        { "<leader>gL", function() Snacks.picker.git_log_line() end,                                      desc = "Git Log Line", },
        { "<leader>gs", function() Snacks.picker.git_status() end,                                        desc = "Git Status", },
        { "<leader>gS", function() Snacks.picker.git_stash() end,                                         desc = "Git Stash", },
        { "<leader>gd", function() Snacks.picker.git_diff() end,                                          desc = "Git Diff (Hunks)", },
        { "<leader>gf", function() Snacks.picker.git_log_file() end,                                      desc = "Git Log File", },
        -- Grep
        { "<leader>sb", function() Snacks.picker.lines() end,                                             desc = "Buffer Lines", },
        { "<leader>sB", function() Snacks.picker.grep_buffers() end,                                      desc = "Grep Open Buffers", },
        { "<leader>sg", function() Snacks.picker.grep() end,                                              desc = "Grep", },
        -- search
        { '<leader>s"', function() Snacks.picker.registers() end,                                         desc = "Registers", },
        { '<leader>s/', function() Snacks.picker.search_history() end,                                    desc = "Search History", },
        { "<leader>sa", function() Snacks.picker.autocmds() end,                                          desc = "Autocmds", },
        { "<leader>sb", function() Snacks.picker.lines() end,                                             desc = "Buffer Lines", },
        { "<leader>sc", function() Snacks.picker.command_history() end,                                   desc = "Command History", },
        { "<leader>sC", function() Snacks.picker.commands() end,                                          desc = "Commands", },
        { "<leader>sd", function() Snacks.picker.diagnostics() end,                                       desc = "Diagnostics", },
        { "<leader>sD", function() Snacks.picker.diagnostics_buffer() end,                                desc = "Buffer Diagnostics", },
        { "<leader>sh", function() Snacks.picker.help() end,                                              desc = "Help Pages", },
        { "<leader>sH", function() Snacks.picker.highlights() end,                                        desc = "Highlights", },
        { "<leader>si", function() Snacks.picker.icons() end,                                             desc = "Icons", },
        { "<leader>sj", function() Snacks.picker.jumps() end,                                             desc = "Jumps", },
        { "<leader>sk", function() Snacks.picker.keymaps() end,                                           desc = "Keymaps", },
        { "<leader>sl", function() Snacks.picker.loclist() end,                                           desc = "Location List", },
        { "<leader>sm", function() Snacks.picker.marks() end,                                             desc = "Marks", },
        { "<leader>sM", function() Snacks.picker.man() end,                                               desc = "Man Pages", },
        { "<leader>sp", function() Snacks.picker.lazy() end,                                              desc = "Search for Plugin Spec", },
        { "<leader>sq", function() Snacks.picker.qflist() end,                                            desc = "Quickfix List", },
        { "<leader>sR", function() Snacks.picker.resume() end,                                            desc = "Resume", },
        { "<leader>su", function() Snacks.picker.undo() end,                                              desc = "Undo History", },
        { "<leader>uC", function() Snacks.picker.colorschemes() end,                                      desc = "Colorschemes", },
        -- other
        { "<leader>bd", function() Snacks.bufdelete() end,                                                desc = "Delete Buffer", },
        -- LSP
        { "gd",         function() Snacks.picker.lsp_definitions { jump = { reuse_win = false, }, } end,  desc = "Goto Definition", },
        { "gD",         function() Snacks.picker.lsp_declarations { jump = { reuse_win = false, }, } end, desc = "Goto Declaration", },
        {
            "gr",
            function() Snacks.picker.lsp_references { jump = { reuse_win = false, }, } end,
            nowait = true,
            desc = "References",
        },
        {
            "gi",
            function() Snacks.picker.lsp_implementations { jump = { reuse_win = false, }, } end,
            desc = "Goto Implementation",
        },
        { "gt",         function() Snacks.picker.lsp_type_definitions() end,                   desc = "Goto T[y]pe Definition", },
        { "<leader>ss", function() Snacks.picker.lsp_symbols() end,                            desc = "LSP Symbols", },

        { "<leader>fc", function() Snacks.picker.files { cwd = vim.fn.stdpath "config", } end, desc = "Find Config File", },
        { "<leader>sS", function() Snacks.picker.lsp_workspace_symbols() end,                  desc = "LSP Workspace Symbols", },
        { "<leader>sw", function() Snacks.picker.grep_word() end,                              desc = "Visual selection or word", mode = { "n", "x", }, },
    }
end

-- cmp
vim.keymap.set("n", "tc", ":CmpToggle<CR>",
    { noremap = true, silent = true, })

-- todo:
vim.keymap.set("n", "]t", function()
    require "todo-comments".jump_next()
end, { noremap = true, silent = true, desc = "Next todo comment", })
vim.keymap.set("n", "[t", function()
    require "todo-comments".jump_prev()
end, { noremap = true, silent = true, desc = "Previous todo comment", })

function M.todo()
    local Snacks = require "snacks"
    return {
        {
            "<leader>st",
            function()
                Snacks.picker.todo_comments { dirs = { vim.api.nvim_buf_get_name(0), }, }
            end,
            desc = "Todo in current folder",
        },
        { "<leader>sT", function() Snacks.picker.todo_comments() end, desc = "Todo", },
    }
end

-- debugger:

vim.keymap.set("n", "<leader>du", function()
    require "dapui".toggle()
end, { noremap = true, silent = true, desc = "Toggle debugger ui", })

local debugger_keys = {
    {
        "<leader>dB",
        function() require "dap".set_breakpoint(vim.fn.input 'Breakpoint condition: ') end,
        desc = "Breakpoint Condition",
    },
    { "<C-b>",      function() require "dap".toggle_breakpoint() end,             desc = "Toggle Breakpoint", },
    { "<leader>dc", function() require "dap".continue() end,                      desc = "Run/Continue", },
    { "<leader>da", function() require "dap".continue { before = get_args, } end, desc = "Run with Args", },
    { "<leader>dC", function() require "dap".run_to_cursor() end,                 desc = "Run to Cursor", },
    { "<leader>dg", function() require "dap".goto_() end,                         desc = "Go to Line (No Execute)", },
    { "<leader>di", function() require "dap".step_into() end,                     desc = "Step Into", },
    { "<leader>dj", function() require "dap".down() end,                          desc = "Down", },
    { "<leader>dk", function() require "dap".up() end,                            desc = "Up", },
    { "<leader>dl", function() require "dap".run_last() end,                      desc = "Run Last", },
    { "<leader>do", function() require "dap".step_out() end,                      desc = "Step Out", },
    { "<C-]>",      function() require "dap".step_over() end,                     desc = "Step Over", },
    { "<leader>dP", function() require "dap".pause() end,                         desc = "Pause", },
    { "<leader>dr", function() require "dap".repl.toggle() end,                   desc = "Toggle REPL", },
    { "<leader>ds", function() require "dap".session() end,                       desc = "Session", },
    { "<leader>dt", function() require "dap".terminate() end,                     desc = "Terminate", },
    { "<leader>dw", function() require "dap.ui.widgets".hover() end,              desc = "Widgets", },
}

for _, value in ipairs(debugger_keys)
do
    vim.keymap.set("n", value[1], value[2], { noremap = true, silent = true, desc = value[3], })
end


-- snippets
function M.snippet()
    local ls = require "luasnip"
    vim.keymap.set({ "i", "s", }, "<C-j>", function()
        ls.jump(1)
    end, { noremap = true, silent = true, })
    vim.keymap.set({ "i", "s", }, "<C-k>", function()
        ls.jump(-1)
    end, { noremap = true, silent = true, })
end

-- gitsigns:
function M.gitsigns(bufnr)
    local gs = require "gitsigns"
    -- local opts = { noremap = true, silent = true, buffer = bufnr, }

    local next_hunk = function()
        if vim.wo.diff then
            vim.cmd.normal { "]c", bang = true, }
        else
            gs.nav_hunk "next"
        end
    end

    local last_hunk = function()
        if vim.wo.diff then
            vim.cmd.normal { "[c", bang = true, }
        else
            gs.nav_hunk "prev"
        end
    end

    return {
        { "]c",         next_hunk,                                     { desc = "next hunk", }, },
        { "[c",         last_hunk,                                     { desc = "previous hunk", }, },
        { "<leader>hs", gs.stage_hunk,                                 { desc = "stage hunk", }, },
        { "<leader>hS", gs.stage_buffer,                               { desc = "stage buffer", }, },
        { "<leader>hR", gs.reset_buffer,                               { desc = "reset buffer", }, },
        { "<leader>hr", gs.reset_hunk,                                 { desc = "reset hunk", }, },
        { "<leader>hp", gs.preview_hunk,                               { desc = "preview hunk", }, },
        { "<leader>hd", gs.diffthis,                                   { desc = "git diff this", }, },
        { "<leader>td", gs.toggle_deleted,                             { desc = "toggle detected", }, },
        { "<leader>ts", gs.toggle_signs,                               { desc = "toggle signs", }, },
        { "<leader>tb", gs.toggle_current_line_blame,                  { desc = "toggle current line blame", }, },
        { "<leader>hb", function() gs.blame_line { full = true, } end, { desc = "blame current line", }, },
    }

    -- vim.keymap.set("n", "]c", next_hunk, opts)
    -- vim.keymap.set("n", "[c", last_hunk, opts)
    -- vim.keymap.set("n", "<leader>hs", gs.stage_hunk)
    -- vim.keymap.set("n", "<leader>hS", gs.stage_buffer)
    -- vim.keymap.set("n", "<leader>hR", gs.reset_buffer, opts)
    -- vim.keymap.set("n", "<leader>hr", gs.reset_hunk)
    -- vim.keymap.set("n", "<leader>hp", gs.preview_hunk, opts)
    -- vim.keymap.set("n", "<leader>hb", function()
    --     gs.blame_line({ full = true })
    -- end, opts)
    -- vim.keymap.set("n", "<leader>hd", gs.diffthis, opts)
    -- -- vim.keymap.set('n', '<leader>hD', function() gs.diffthis('~') end, opts)
    -- vim.keymap.set("n", "<leader>td", gs.toggle_deleted, opts)
    -- vim.keymap.set("n", "<leader>tb", gs.toggle_current_line_blame, opts)
    -- vim.keymap.set("n", "<leader>ts", gs.toggle_signs, opts)
end

--lsp:
function M.lsp(client, bufnr)
    local opts = { noremap = true, silent = true, buffer = bufnr, }
    -- vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    -- vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    -- vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    -- vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    -- vim.keymap.set('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    -- vim.keymap.set('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    -- vim.keymap.set('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    -- vim.keymap.set('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    -- vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "ga", function()
        vim.lsp.buf.code_action { apply = true, }
    end, opts)
    -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
    vim.keymap.set("n", "<leader>l", vim.diagnostic.setloclist, opts)
    vim.keymap.set("n", "ti", ":InlayToggle<CR>", opts)
    if client.name == "clangd" then
        vim.keymap.set("n", "<leader>o<Tab>",
            ":call v:lua.bufferCopy(0)<CR>",
            { noremap = true, silent = true, })
        vim.keymap.set("n", "<leader>oo",
            ":LspClangdSwitchSourceHeader<CR>",
            { noremap = true, silent = true, })
        -- vim.keymap.set("n", "<leader>oh", ":ClangdTypeHierarchy<CR>",
        --     { noremap = true, silent = true, })
    end
    --     vim.keymap.set('n', '<space>fm', function() vim.lsp.buf.format({ async = true }) end, opts)
    -- end
    -- if client.name == 'cmake' then
    --     vim.keymap.set('n', '<space>fm', '<cmd>FormatWrite<cr>', opts)
    -- end
end

function M.conform()
    return {
        {
            "<leader>fm",
            function() require "conform".format { lsp_format = "first", } end,
            desc = "Code formatting using conform",
        },
    }
end

function M.oil()
    return { { "-", "<CMD>Oil<CR>", desc = "Open parent directory", }, }
end

function M.hover()
    return {
        {
            "K",
            function()
                local api = vim.api
                local hover_win = vim.b.hover_preview
                if hover_win and api.nvim_win_is_valid(hover_win) then
                    api.nvim_set_current_win(hover_win)
                else
                    require "hover".hover()
                end
            end,
            { desc = "hover.nvim", },
        },
    }
end

function M.trouble()
    return {
        { "<leader>xX", "<cmd>Trouble diagnostics toggle<cr>",              desc = "Diagnostics (Trouble)", },
        { "<leader>xx", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer Diagnostics (Trouble)", },
        { "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>",      desc = "Symbols (Trouble)", },
        { "<leader>xL", "<cmd>Trouble loclist toggle<cr>",                  desc = "Location List (Trouble)", },
        { "<leader>xQ", "<cmd>Trouble qflist toggle<cr>",                   desc = "Quickfix List (Trouble)", },
        {
            "<leader>cl",
            "<cmd>Trouble lsp toggle focus=false win.position=bottom<cr>",
            desc = "LSP Definitions / references / ... (Trouble)",
        },
    }
end

return M
