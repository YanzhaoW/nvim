require("conform").setup({
    formatters_by_ft = {
        lua = { "stylua", lsp_format = "fallback" },
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
        rst = { "docstrfmt", lsp_format = "fallback" },
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

-- require("conform").formatters.rstfmt = {
-- 	command = "rstfmt",
-- 	args = { "$FILENAME" },
-- 	stdin = false,
-- }
--
--
require("conform").formatters.docstrfmt = {
    meta = {
        url = "https://github.com/LilSpazJoekp/docstrfmt",
        description = "reStructuredText formatter.",
    },
    command = "docstrfmt",
    args = { "$FILENAME", "-l", "30000000" },
    stdin = false,
}

require("conform").formatters.black = {
    args = {
        "--stdin-filename",
        "$FILENAME",
        "--quiet",
        "--line-length=79",
        "-",
    },
}
