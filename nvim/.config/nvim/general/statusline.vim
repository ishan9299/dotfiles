set statusline=
set statusline+=%#PmenuSel#
set statusline+=\ %{toupper(g:currentmode[mode()])}
set statusline+=%*
set statusline+=%{fugitive#statusline()}
set statusline+=%1*
set statusline+=\ %f\ 
set statusline+=%3*
set statusline+=[%M%H]
set statusline+=%{&readonly?'\ []':''}
set statusline+=%=
set statusline+=\  
set statusline+=%5*
set statusline+=Ln\ 
set statusline+=%l,
set statusline+=Col\ 
set statusline+=%c\  
set statusline+=%4*
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\ 
set statusline+=%2*
set statusline+=%y

hi User1 cterm=bold ctermfg=7 guifg=yellow guibg=NONE
hi User2 cterm=bold ctermfg=7 guifg=orange guibg=NONE
hi User3 cterm=bold ctermfg=7 guifg=grey guibg=NONE
hi User4 cterm=bold ctermfg=7 guifg=#dc9656 guibg=NONE
hi User5 cterm=bold ctermfg=7 guifg=#d8d8d8 guibg=NONE

" statusline settings
let g:currentmode={
       \ 'n'  : 'NORMAL ',
       \ 'v'  : 'VISUAL ',
       \ 'V'  : 'V·Line ',
       \ '' : 'V·Block ',
       \ 'i'  : 'INSERT ',
       \ 'R'  : 'R ',
       \ 'Rv' : 'V·Replace ',
       \ 'c'  : 'Command ',
       \}
