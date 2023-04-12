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

vim.g.lsp_format_modifications_silence = true
vim.g.oscyank_silent = true

vim.cmd('filetype plugin indent on')
-- vim.cmd('hi! MatchParen gui=reverse,bold guibg=reverse')
-- vim.cmd([[
-- augroup usergroup
-- autocmd!
-- autocmd FileType text,tex,markdown setlocal spell spelllang=en_us,de_de
-- autocmd FileType text,tex,markdown set spellcapcheck=
-- au FileType markdown hi! MatchParen gui=bold guifg='#8f96a3'
-- au BufNewFile,BufRead tex syntax spell toplevel
-- autocmd FileType cpp :lua vim.api.nvim_buf_set_option(0, "commentstring", "// %s")
-- autocmd User TelescopePreviewerLoaded setlocal wrap
-- augroup END
-- ]])

local my_augroup = vim.api.nvim_create_augroup("mygroup", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "text", "tex", "markdown" }, -- disable spellchecking for these filetypes
    command = "setlocal spell spelllang=en_us,de_de | set spellcapcheck= | syntax spell toplevel",
    group = my_augroup,
})

vim.api.nvim_create_autocmd("User", {
    pattern = { "TelescopePreviewerLoaded" }, -- disable spellchecking for these filetypes
    command = "setlocal wrap",
    group = my_augroup,
})

-- change lsp signs:
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
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
