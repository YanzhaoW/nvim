require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "isort", "black" },
		markdown = { "prettier" },
		javascript = { "prettier" },
		typescript = { "prettier" },
		json = { "prettier" },
		zsh = { "beautysh" },
		bash = { "beautysh" },
		shell = { "beautysh" },
		html = { "htmlbeautifier" },
		xhtml = { "htmlbeautifier" },
		cmake = { "cmake_format" },
		cpp = { "clang-format" },
		tex = { "latexindent" },
		bib = { "latexindent" },
	},
})

require("conform").formatters.prettier = {
	ft_parsers = {
		--     javascript = "babel",
		--     javascriptreact = "babel",
		--     typescript = "typescript",
		--     typescriptreact = "typescript",
		--     vue = "vue",
		css = "css",
		--     scss = "scss",
		--     less = "less",
		html = "html",
		json = "json",
		--     jsonc = "json",
		yaml = "yaml",
		markdown = "markdown",
		["markdown.mdx"] = "mdx",
		--     graphql = "graphql",
		--     handlebars = "glimmer",
	},
	-- Use a specific prettier parser for a file extension
	-- ext_parsers = {
	--     qmd = "markdown",
	-- },
}
