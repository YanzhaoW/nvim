local config_path = vim.fn.stdpath "config"
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

local on_attach = function(client, bufnr)
    require "ltex_extra".setup {
        load_langs = { "en-US", },
        init_check = true,
        path = vim.fn.stdpath "config" .. "/spell",
        log_level = "none",
    }
end

vim.lsp.config.ltex_plus = {
    cmd = { "ltex-ls-plus", },
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
        'typst',
        'xhtml',
    },
    on_attach = on_attach,
    settings = {
        ltex = {
            langauge = "en-US",
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
                'typst',
                'xhtml',
            },
            dictionary = { ["en-US"] = {}, },
            disabledRules = { ["en-US"] = {}, },
            hiddenFalsePositives = { ["en-US"] = {}, },
        },
    },
    on_init = on_init,
}

vim.lsp.enable "ltex_plus"
