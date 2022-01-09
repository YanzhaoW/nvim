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





vim.cmd([[let g:nvim_tree_special_files = { }]])
require'nvim-tree'.setup{
    view = {
        side = 'right'
    },
    auto_close = true
}
