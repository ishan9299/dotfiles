if has('autocmd')
    augroup customautocmd
    autocmd!
    autocmd ColorScheme * :hi Vertsplit ctermfg=NONE ctermbg=NONE guibg=NONE guifg=NONE
    autocmd ColorScheme * :set fillchars=vert:\ 
    autocmd BufRead,BufNewFile *.ASM :set ft=nasm
    autocmd BufRead,BufNewFile *.asm :set ft=nasm
    augroup END
endif
