let g:plug_window = 'noautocmd vertical topleft new'
let g:NERDTreeUseSimpleIndicator = 1

" If more than one window and previous buffer was NERDTree, go back to it.
autocmd BufEnter * if bufname('#') =~# "^NERD_tree_" && winnr('$') > 1 | b# | endif

let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''
let NERDTreeShowHidden=1

map <C-E> :NERDTreeToggle<CR>
