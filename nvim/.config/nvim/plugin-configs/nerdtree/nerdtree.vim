" Toggle nerdtree window and keep cursor in file window,
" adapted from https://stackoverflow.com/q/24808932/6064933
nnoremap <silent> <C-e> :NERDTreeToggle<CR>

" Delete a file buffer when you have deleted it in nerdtree
let NERDTreeAutoDeleteBuffer = 1

" Show current root as realtive path from HOME in status bar,
" see https://github.com/scrooloose/nerdtree/issues/891
let NERDTreeStatusline="%{exists('b:NERDTree')?fnamemodify(b:NERDTree.root.path.str(), ':~'):''}"

" Disable bookmark and 'press ? for help' text
let NERDTreeMinimalUI=1
let NERDTreeShowHidden=1
let g:NERDTreeDirArrowExpandable = '⮞'
let g:NERDTreeDirArrowCollapsible = '⮟'
