" Goyo
let g:goyo_width=140
nnoremap <C-k>z :Goyo<cr>

" Better nav for omnicomplete
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")


" Save and Quit
nnoremap <Leader>wq :wq<cr>
nnoremap <Leader>qq :q!<cr>
nnoremap <C-s> :w<cr>
inoremap <C-s> :w<cr>

" With this maps you can now toggle the terminal
nnoremap <F7> :call terminal#terminal#MonkeyTerminalToggle()<cr>
tnoremap <F7> <C-\><C-n>:call terminal#terminal#MonkeyTerminalToggle()<cr>
