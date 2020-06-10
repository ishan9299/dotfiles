if has('autocmd')
    augroup customautocmd
    autocmd!
    autocmd ColorScheme * :hi Vertsplit ctermfg=NONE ctermbg=NONE guibg=NONE guifg=NONE
    autocmd ColorScheme * :set fillchars=vert:\ 
    autocmd ColorScheme * :hi User1 cterm=bold ctermfg=7 guifg=yellow guibg=NONE
    autocmd ColorScheme * :hi User2 cterm=bold ctermfg=7 guifg=orange guibg=NONE
    autocmd ColorScheme * :hi User3 cterm=bold ctermfg=7 guifg=grey guibg=NONE
    autocmd ColorScheme * :hi User4 cterm=bold ctermfg=7 guifg=#dc9656 guibg=NONE
    autocmd ColorScheme * :hi User5 cterm=bold ctermfg=7 guifg=#d8d8d8 guibg=NONE
    autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
    autocmd FileType json syntax match Comment +\/\/.\+$+
    augroup END
endif
