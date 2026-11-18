return {
    "lervag/vimtex",
    ft = { "tex", "plaintex", },
    init = function()
        vim.g.vimtex_view_method = "skim"
        vim.g.vimtex_view_skim_reading_bar = 1
        vim.g.vimtex_view_skim_activate = 1

        -- vim.g.vimtex_view_general_viewer = "mupdf-gl"

        vim.g.vimtex_compiler_enabled = 1
        vim.g.vimtex_compiler_method = "generic"
        local build_dir = vim.fn.getcwd() .. "/build"
        vim.g.vimtex_compiler_generic = { command = "cmake --build " .. build_dir, }

        vim.env.VIMTEX_OUTPUT_DIRECTORY = build_dir
        vim.g.vimtex_compiler_latexmk = { out_dir = build_dir, }

        vim.g.vimtex_quickfix_blgparser = { disable = true, }
        vim.g.vimtex_quickfix_mode = 0

        require "keymapping".vimtex()
        -- vim.g.vimtex_format_enabled = 1
    end,
}
