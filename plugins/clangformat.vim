if executable('clang-format')
        let g:clang_format#command="clang-format"
elseif executable('clang-format-10')
        let g:clang_format#command="clang-format-10"
elseif executable('clang-format-11')
        let g:clang_format#command="clang-format-11"
elseif executable('clang-format-12')
        let g:clang_format#command="clang-format-12"
elseif executable('clang-format-13')
        let g:clang_format#command="clang-format-13"
else
        echom "executable clang-format not found"
endif
let g:clang_format#auto_format=0
