local config_path = vim.fn.stdpath("config")
local on_init = function(client, bufnr)
    _ = bufnr
    local spell_file_name = config_path .. '/spell/en.utf-8.add'
    local spell_file = io.open(spell_file_name, 'r')
    if spell_file then
        local dict = client.config.settings.ltex.dictionary['en-US']
        for line in spell_file:lines() do
            table.insert(dict, line)
        end
        spell_file:close()
    end
end

vim.lsp.config.ltex_plus = {
    cmd = { "ltex-ls-plus" },
    filetypes = {
        'bib',
        'context',
        'gitcommit',
        'html',
        'markdown',
        'org',
        'pandoc',
        'plaintex',
        'quarto',
        'mail',
        'mdx',
        'rmd',
        'rnoweb',
        'rst',
        'tex',
        'text',
        'typst',
        'xhtml',
    },
    settings = {
        ltex = {
            enabled = {
                'bib',
                'context',
                'gitcommit',
                'html',
                'markdown',
                'org',
                'pandoc',
                'plaintex',
                'quarto',
                'mail',
                'mdx',
                'rmd',
                'rnoweb',
                'rst',
                'tex',
                'latex',
                'text',
                'typst',
                'xhtml',
            },
            dictionary = {
                ["en-US"] = {},
            },
            disabledRules = {
                ["en-US"] = { "NUMBERS_IN_WORDS" },
            }
        },
    },
    on_init = on_init,
}

vim.lsp.enable("ltex_plus")
