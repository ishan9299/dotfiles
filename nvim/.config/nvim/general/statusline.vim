set statusline=
set statusline+=%1*
set statusline+=\ %f\                
set statusline+=[%M%H]
set statusline+=%=
set statusline+=\  
set statusline+=Ln\ 
set statusline+=%l,
set statusline+=Col\ 
set statusline+=%c\  
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\ 
set statusline+=%y

hi User1 cterm=bold ctermfg=7 guifg=7 guibg=NONE ctermbg=NONE
