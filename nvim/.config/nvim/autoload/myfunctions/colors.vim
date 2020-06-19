function! myfunctions#colors#setcolor() abort
    if &background ==# "dark"  " '#' means case sensitive no matter what
        hi User1 cterm=bold ctermfg=7 guifg=yellow guibg=NONE gui=bold
        hi User5 guifg=reverse gui=bold
    else
        hi User1 cterm=bold ctermfg=7 guifg=teal guibg=NONE gui=bold
        hi User5 guifg=reverse gui=bold
    endif

    hi User2 cterm=bold ctermfg=7 guifg=darkorange guibg=NONE gui=bold
    hi User3 cterm=bold ctermfg=7 guifg=darkgrey guibg=NONE gui=bold
    hi User4 cterm=bold ctermfg=7 guifg=#dc9656 guibg=NONE gui=bold
    hi Vertsplit guibg=NONE guifg=NONE gui=NONE
    set fillchars=vert:\│
endfunction
