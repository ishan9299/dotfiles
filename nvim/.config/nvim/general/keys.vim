" Leader key
nnoremap <Space> <Nop>
let mapleader="\<Space>"

"sourcing the vimrc
nnoremap <leader>sv :source $MYVIMRC<CR>
nnoremap <leader>ev :edit $MYVIMRC<CR>

"disabling arrow keys
nnoremap <up>    <nop>
nnoremap <down>  <nop>
nnoremap <left>  <nop>
nnoremap <right> <nop>
inoremap <up>    <nop>
inoremap <down>  <nop>
inoremap <left>  <nop>
inoremap <right> <nop>

" Buffers
nnoremap <leader>bd :bd<CR>


" Goyo
let g:goyo_width=140
let g:goyo_linenr=1
nnoremap <C-k><C-z> :Goyo<cr>

" Better nav for omnicomplete
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")

" Split Windows
nnoremap <Leader>hs :split<cr>
nnoremap <Leader>vs :vsplit<cr>

" Windows
nnoremap <Leader>wl  <C-w>l
nnoremap <Leader>wk  <C-w>k
nnoremap <Leader>wj  <C-w>j
nnoremap <Leader>wh  <C-w>h
nnoremap <Leader>wd  :q<cr> 

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
autocmd filetype c nnoremap <F5> :w <bar> exec '!gcc -g '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR> 
autocmd filetype cpp nnoremap <F5> :w <bar> exec '!g++ -g '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
