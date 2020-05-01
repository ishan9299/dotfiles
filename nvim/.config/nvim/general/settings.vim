"Relative Line number
set nu rnu

" Disable autocommenting
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"AutoPairs
let g:AutoPairsFlyMode = 1

"colorscheme
set background=dark
"set background=light
:colorscheme hybrid_reverse
":colorscheme hybrid_material
let g:enable_bold_font = 1
let g:hybrid_transparent_background = 0
let g:enable_italic_font = 1

" Default Indentation
set autoindent
set termguicolors
set expandtab       " expand tab to space
set smartindent     " indent when
set tabstop=4       " tab width
set softtabstop=4   " backspace
set shiftwidth=4    " indent width
set mouse=a         " if I am lazy to go keyboard
set cursorline

