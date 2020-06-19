" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Tab as completion trigger
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ completion#trigger_completion()

" possible value: 'UltiSnips', 'Neosnippet', 'vim-vsnip'
let g:completion_enable_snippet = 'UltiSnips'

" Chain Completion
let g:completion_chain_complete_list = [
    \{'complete_items': ['lsp', 'snippet']},
    \{'mode': '<c-p>'},
    \{'mode': '<c-n>'}
\]

" Switch completion source
inoremap <c-j> <cmd>lua require'source'.prevCompletion()<CR> "use <c-j> to switch to previous completion
inoremap <c-k> <cmd>lua require'source'.nextCompletion()<CR> "use <c-k> to switch to next completion

" Change the completion source automatically if no completion availabe
let g:completion_auto_change_source = 1

" Delete on completion
let g:completion_trigger_on_delete = 1
