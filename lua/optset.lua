vim.opt.number = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.incsearch = true
-- vim.opt.backspace = { 'indent', 'start' }
vim.opt.backspace = { 'indent', 'start', 'eol' }
vim.opt.scrolloff = 4
vim.opt.hidden = true
vim.opt.cmdheight = 1
vim.opt.mouse = 'a'
vim.opt.inccommand = 'nosplit'
vim.opt.showmode = false
vim.opt.conceallevel = 0
vim.opt.splitright = true
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.pumheight = 15
vim.opt.clipboard = "unnamedplus"
vim.opt.ignorecase = true
vim.opt.spelloptions = 'noplainbuffer'
vim.opt.signcolumn = 'yes'
vim.diagnostic.config({ virtual_text = false })

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.lsp_format_modifications_silence = true
vim.g.nvim_tree_disable_netrw = 0
vim.g.oscyank_silent = true
vim.cmd('cnoreabbrev git Git')

-- change lsp signs:
local signs = { Error = ' ', Warn = ' ', Hint = " ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

if (os.getenv("TMUX") ~= nil) then
    vim.g.clipboard = {
        name = 'myClipboard',
        copy = {
            ["+"] = { 'tmux', 'load-buffer', '-' },
            ["*"] = { 'tmux', 'load-buffer', '-' },
        },
        paste = {
            ["+"] = { 'tmux', 'save-buffer', '-' },
            ["*"] = { 'tmux', 'save-buffer', '-' },
        },
        cache_enabled = true,
    }
end

-- vim.cmd("colorscheme onedark")
-- require 'plugs.colorscheme'.SetSemHi()
vim.cmd("colorscheme kanagawa-wave")
