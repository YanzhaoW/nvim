vim.lsp.config.cmake = {
    cmd = { "cmake-language-server", },
    filetypes = { "cmake", },
    init_options = { buildDirectory = "build", },
    single_file_support = true,
    root_markers = { "CMakePresets.json", ".clangd", ".git", "compile_commands.json", ".cmake-format", "conanfile.py", },
}
vim.lsp.enable "cmake"
