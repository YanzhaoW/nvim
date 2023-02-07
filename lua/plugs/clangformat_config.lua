if (vim.fn.executable('clang-format-8') == 1) then
    vim.g['clang_format#command']='clang-format-8'
elseif(vim.fn.executable('clang-format-10') == 1) then
    vim.g['clang_format#command']='clang-format-10'
elseif(vim.fn.executable('clang-format-11') == 1) then
    vim.g['clang_format#command']='clang-format-11'
elseif(vim.fn.executable('clang-format-12') == 1) then
    vim.g['clang_format#command']='clang-format-12'
elseif(vim.fn.executable('clang-format-13') == 1) then
    vim.g['clang_format#command']='clang-format-13'
elseif(vim.fn.executable('clang-format') == 1) then
    vim.g['clang_format#command']='clang-format'
end
vim.g['clang_format#auto_format']=1
vim.g['clang_format#auto_format_on_insert_leave'] = 0
