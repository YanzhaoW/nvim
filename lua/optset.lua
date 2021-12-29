vim.opt.number = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.incsearch = true
vim.opt.backspace = {'indent', 'eol', 'start'}
vim.opt.scrolloff = 4
vim.opt.hidden = true
vim.opt.cmdheight = 1
vim.opt.mouse='a'
vim.opt.inccommand='nosplit'
vim.opt.showmode = false
vim.opt.conceallevel = 0
vim.opt.splitright = true
vim.opt.cursorline = true

vim.cmd('filetype plugin indent on')
vim.cmd([[
augroup spellgroup
autocmd!
autocmd FileType text,tex setlocal spell spelllang=en_us,de_de
autocmd FileType text,tex set spellcapcheck=
au BufNewFile,BufRead * syntax spell toplevel
augroup END
]])
