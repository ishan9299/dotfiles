" Default Indentation
set autoindent
set termguicolors
set t_Co=256            " Support 256 colors
set expandtab           " expand tab to space
set smartindent         " indent when
set tabstop=4           " tab width
set softtabstop=4       " backspace
set shiftwidth=4        " indent width
set mouse=a             " if I am lazy to go keyboard
set nu rnu              " relative line numbers
set updatetime=300      " Faster completion
set timeoutlen=1000      " By default timeoutlen is 1000 ms
set formatoptions-=cro  " Stop newline continution of comments
set cursorline
set ruler
set noshowmode
set nobackup            " This is recommended by coc
set nowritebackup       " This is recommended by coc

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
autocmd FileType json syntax match Comment +\/\/.\+$+

" colorscheme
let base16colorspace=256  " Access colors present in 256 colorspace
set bg=dark
colorscheme base16-material-vivid

augroup colors
    autocmd!
    autocmd ColorScheme * :hi Vertsplit ctermfg=NONE ctermbg=NONE guibg=NONE guifg=NONE
augroup END

:set fillchars+=vert:\ 

" Transperency
" hi! Normal ctermbg=NONE guibg=NONE 
" hi! NonText ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE 
