"Set Leader to Space
let mapleader = "\<Space>"
:imap jk <Esc>
:imap kj <Esc>

" Reload vimrc
nnoremap <leader>rc :source<Space> ~/.config/nvim/init.vim<cr>
" Shortcut to config file
nnoremap <leader>ec :edit ~/.config/nvim/init.vim<cr>

"disabling arrow keys
nnoremap <up>    <nop>
nnoremap <down>  <nop>
nnoremap <left>  <nop>
nnoremap <right> <nop>
inoremap <up>    <nop>
inoremap <down>  <nop>
inoremap <left>  <nop>
inoremap <right> <nop>

" Goyo
map <C-g> :Goyo<cr>
map <C-h> :Goyo 135<cr>

" Tab Stuff
nnoremap <Leader>tn :tabnew<cr>
nnoremap <Leader>tk :tabnext<cr>
nnoremap <Leader>tj :tabprev<cr>
nnoremap <Leader>th :tabfirst<cr>
nnoremap <Leader>tl :tablast<cr>

" Split Windows
nnoremap <Leader>ws :split<cr>
nnoremap <Leader>wv :vsplit<cr>

" Windows
nnoremap <Leader>wl  <C-w>l
nnoremap <Leader>wk  <C-w>k
nnoremap <Leader>wj  <C-w>j
nnoremap <Leader>wh  <C-w>h
nnoremap <Leader>wd  :q<cr> 

" tab stuff
nnoremap tn :tabnew<cr>
nnoremap tk :tabnext<cr>
nnoremap tj :tabprev<cr>
nnoremap th :tabfirst<cr>
nnoremap tl :tablast<cr>

" Easy motion
nmap <Leader>ss <Plug>(easymotion-overwin-f)

"Compiling C/C++ (% is file name and %:r file name without extension)
autocmd filetype c nnoremap <F5> :w <bar> exec '!gcc -g '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR> 
autocmd filetype cpp nnoremap <F5> :w <bar> exec '!g++ -g '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
