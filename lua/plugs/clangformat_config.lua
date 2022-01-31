if (vim.fn.executable('clang-format') == 1) then
    vim.g['clang_format#command']='clang-format'
elseif(vim.fn.executable('clang-format-10') == 1) then
    vim.g['clang_format#command']='clang-format-10'
elseif(vim.fn.executable('clang-format-11') == 1) then
    vim.g['clang_format#command']='clang-format-11'
elseif(vim.fn.executable('clang-format-12') == 1) then
    vim.g['clang_format#command']='clang-format-12'
elseif(vim.fn.executable('clang-format-13') == 1) then
    vim.g['clang_format#command']='clang-format-13'
else
    print('executable clang-format not found')
end
vim.g['clang_format#auto_format']=0
