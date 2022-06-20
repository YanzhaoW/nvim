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





require'nvim-tree'.setup{
    view = {
        side = 'right'
    },
    update_focused_file = {
        enable = true,
        update_cwd = true,
        ignore_list = {}
    }
}
-- vim.cmd([[autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif]])
