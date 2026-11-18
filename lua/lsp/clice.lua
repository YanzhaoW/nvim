vim.lsp.config("clice", {
    cmd = { "clice", "serve", },
    cmd_env = { CLICE_LOG_LEVEL = "debug", },
    filetypes = { "c", "cpp", "cuda", },
    root_markers = { "clice.toml", "compile_commands.json", ".git", },
    init_options = { diagnostics = {
        clang_tidy = true,
        slow_clang_tidy_checks = true,
    }, },
})

-- vim.lsp.enable "clice"
