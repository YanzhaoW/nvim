--theme:
-- onedark.vim override: Don't set a background color when running in a terminal;
if( vim.fn.has('autocmd') and not( vim.fn.has('gui_running') )) then
    vim.api.nvim_command(
    [[
    augroup colorset
    autocmd!
    let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16" : "7" }
    autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white }) 
    augroup END
    ]] 
    )
end

vim.cmd([[hi Comment cterm=italic]])

vim.g.onedark_hide_endofbuffer=1
vim.g.onedark_terminal_italics=1
vim.g.onedark_termcolors=256
vim.g.onedark_transparent_background = true

require('onedark').setup()



