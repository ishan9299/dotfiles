let g:currentmode={
    \ 'n'      : 'NORMAL ',
    \ 'no'     : 'N·Operator Pending ',
    \ 'v'      : 'VISUAL ',
    \ 'V'      : 'V·Line ',
    \ '\<C-V>' : 'V·Block ',
    \ 's'      : 'Select ',
    \ 'S'      : 'S·Line ',
    \ '\<C-S>' : 'S·Block ',
    \ 'i'      : 'INSERT ',
    \ 'R'      : 'REPLACE ',
    \ 'Rv'     : 'V·Replace ',
    \ 'c'      : 'Command ',
    \ 'cv'     : 'Vim Ex ',
    \ 'ce'     : 'Ex ',
    \ 'r'      : 'Prompt ',
    \ 'rm'     : 'More ',
    \ 'r?'     : 'Confirm ',
    \ '!'      : 'Shell ',
    \ 't'      : 'Terminal '
    \}

set statusline=
set statusline+=%#PmenuSel#
set statusline+=\ %{toupper(g:currentmode[mode()])}
set statusline+=%5*\ 
set statusline+=%{GitInfo()}
set statusline+=\ 
set statusline+=%1*
set statusline+=»\ 
set statusline+=%<%-.40f
set statusline+=\ «
set statusline+=%<
set statusline+=%3*
set statusline+=\ [%M%H]
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

function! GitInfo()
  let git = fugitive#head()
  if git != ''
    return ' '.fugitive#head()
  else
    return ''
endfunction
