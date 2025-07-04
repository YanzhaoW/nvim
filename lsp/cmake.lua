return {
	cmd = { "cmake-language-server" },
	filetypes = { "cmake" },
	init_options = {
		buildDirectory = "build",
	},
	single_file_support = true,
	root_markers = { ".clangd", ".git", "compile_commands.json", ".cmake-format" },
}
