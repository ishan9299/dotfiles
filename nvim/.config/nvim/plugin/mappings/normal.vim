" Use alt + hjkl to resize windows
nnoremap <M-j>    :resize -2<CR>
nnoremap <M-k>    :resize +2<CR>
nnoremap <M-h>    :vertical resize -2<CR>
nnoremap <M-l>    :vertical resize +2<CR>

" tab stuff
nnoremap tn :tabnew<cr>
nnoremap tk :tabnext<cr>
nnoremap tj :tabprev<cr>
nnoremap th :tabfirst<cr>
nnoremap tl :tablast<cr>

"Compiling C/C++ (% is file name and %:r file name without extension)
" autocmd filetype c nnoremap <F5> :w <bar> exec '!gcc -g '.shellescape('%').' -o '.shellescape('%:r').'<CR> 
" autocmd filetype cpp nnoremap <F5> :w <bar> exec '!g++ -g '.shellescape('%').' -o '.shellescape('%:r').'<CR>
