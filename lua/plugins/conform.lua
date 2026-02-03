require "conform".setup {
    formatters_by_ft = {
        lua = { lsp_format = "fallback", },
        python = { "isort", "black", },
        markdown = { "prettier", lsp_format = "fallback", },
        javascript = { "prettier", },
        typescript = { "prettier", },
        json = { "prettier", lsp_format = "fallback", },
        zsh = { "beautysh", },
        bash = { "beautysh", },
        shell = { "beautysh", },
        html = { "htmlbeautifier", },
        xhtml = { "htmlbeautifier", },
        -- cmake = { "cmake_format" },
        cmake = { "gersemi", },
        cpp = { "clang-format", },
        tex = { "latexindent", },
        bib = { "latexindent", },
        -- rst = { lsp_format = "fallback" },
        rst = { "docstrfmt", lsp_format = "fallback", },
    },
}
vim.o.formatexpr = "v:lua.require('conform').formatexpr({'timeout_ms':2000})"

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
		-- json = "json",
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

-- require("conform").formatters.rstfmt = {
-- 	command = "rstfmt",
-- 	args = { "$FILENAME" },
-- 	stdin = false,
-- }
--
--
require "conform".formatters.docstrfmt = {
    meta = { url = "https://github.com/LilSpazJoekp/docstrfmt", description = "reStructuredText formatter.", },
    command = "docstrfmt",
    args = { "$FILENAME", "-l", "30000000", },
    stdin = false,
}

require "conform".formatters.black = { args = { "--stdin-filename", "$FILENAME", "--quiet", "--line-length=79", "-", }, }
