return {
	filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
	cmd = {
		-- see clangd --help-hidden
		"clangd",
		"--background-index",
		"--clang-tidy",
		"--all-scopes-completion",
		"--header-insertion-decorators",
		-- "--experimental-modules-support", // this breaks the single file
		"--pch-storage=memory",
		"--completion-style=bundled",
		"--cross-file-rename",
		"--header-insertion=iwyu",
	},
	init_options = {
		clangdFileStatus = true, -- Provides information about activity on clangd’s per-file worker thread
		usePlaceholders = true,
		completeUnimported = true,
		semanticHighlighting = true,
		fallbackFlags = { "-std=c++23" },
	},
	root_markers = { ".clangd", ".git", "compile_commands.json" },
	single_file_support = true,
}
