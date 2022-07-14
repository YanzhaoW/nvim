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
    hijack_directories = {
        auto_open = false,
    },
    update_focused_file = {
        enable = true,
        update_cwd = true,
        ignore_list = {},
    }
}
