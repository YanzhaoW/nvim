vim.opt.number = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.incsearch = true
-- vim.opt.backspace = { 'indent', 'start' }
vim.opt.backspace = { "indent", "start", "eol", }
vim.opt.scrolloff = 4
vim.opt.hidden = true
vim.opt.cmdheight = 1
vim.opt.mouse = "a"
vim.opt.inccommand = "nosplit"
vim.opt.showmode = false
vim.opt.conceallevel = 0
vim.opt.splitright = true
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.pumheight = 15
vim.opt.clipboard = "unnamedplus"
vim.opt.ignorecase = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 2
vim.opt.spelloptions = "noplainbuffer"
vim.opt.signcolumn = "yes"

vim.diagnostic.config {
    virtual_text = false,
    float = { show_header = true, source = 'always', border = 'rounded', focusable = true, },
}

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.lsp_format_modifications_silence = true
vim.g.nvim_tree_disable_netrw = 0
vim.g.oscyank_silent = true
vim.cmd "cnoreabbrev git Git"
vim.cmd "cnoreabbrev gcb Gcb"
vim.cmd "cnoreabbrev gdiff Gdiff"
vim.cmd "cnoreabbrev <expr> w\\ (getcmdtype()==':' && getcmdline()==# 'w\\')? 'w': 'w\\'"

vim.filetype.add { pattern = { [".*/.*%.sshconfig"] = "sshconfig", }, }
vim.deprecate = function() end

vim.g._ts_force_sync_parsing = true

-- change lsp signs:
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " ", }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "", })
end

if os.getenv "TMUX" ~= nil then
    vim.g.clipboard = {
        name = "tmux clipboard",
        copy = { ["+"] = { "tmux", "load-buffer", "-", }, ["*"] = { "tmux", "load-buffer", "-", }, },
        paste = { ["+"] = { "tmux", "save-buffer", "-", }, ["*"] = { "tmux", "save-buffer", "-", }, },
        cache_enabled = true,
    }
end

-- vim.cmd("colorscheme onedark")
-- require 'plugs.colorscheme'.SetSemHi()
vim.cmd "colorscheme kanagawa-wave"
-- vim.cmd "colorscheme gruvbox"
