" Goyo
let g:goyo_width=140
nnoremap <C-k>z :Goyo<cr>

" Save and Quit
nnoremap <Leader>wq :wq<cr>
nnoremap <Leader>qq :q!<cr>
nnoremap <C-s> :w<cr>
inoremap <C-s> :w<cr>

" With this maps you can now toggle the terminal
nnoremap <F7> :MonkeyTerminal<cr>
tnoremap <F7> <C-\><C-n>:MonkeyTerminal<cr>

" Fugitive
nnoremap <Leader>gj :diffget //3<CR>
nnoremap <Leader>gf :diffget //2<CR>
nnoremap <Leader>gs :G<CR>

" Brackets
inoremap (; (<CR>);<C-c>O
inoremap (, (<CR>),<C-c>O
inoremap {; {<CR>};<C-c>O
inoremap {, {<CR>},<C-c>O
inoremap [; [<CR>];<C-c>O
inoremap [, [<CR>],<C-c>O
