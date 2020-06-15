set colorcolumn=100
nnoremap <F4> :w <bar> exec '!g++ '.shellescape('%').' -o '.shellescape('%:r').'' <CR>
lua require'completion'.on_attach()
cd ~/Programming
