if has('autocmd')
    augroup customautocmd
    autocmd!
    autocmd ColorScheme * :hi Vertsplit ctermfg=NONE ctermbg=NONE guibg=NONE guifg=NONE
    autocmd ColorScheme * :set fillchars=vert:\ 
    autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
    autocmd FileType json syntax match Comment +\/\/.\+$+
    augroup END
endif
