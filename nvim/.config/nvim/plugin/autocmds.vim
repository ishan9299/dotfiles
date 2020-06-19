if has('autocmd')
    augroup customautocmd
    autocmd!
    autocmd ColorScheme * :call myfunctions#colors#setcolor()
    autocmd UIEnter * call myfunctions#firenvim#OnUIEnter(deepcopy(v:event))
    autocmd BufRead,BufNewFile *.ASM :set ft=nasm
    autocmd BufRead,BufNewFile *.asm :set ft=nasm
    augroup END
endif
