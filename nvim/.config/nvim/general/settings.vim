"Set Leader to Space
let mapleader = "\<Space>"
:imap jk <Esc>
:imap kj <Esc>

" Default Indentation
set autoindent
set termguicolors
set expandtab       " expand tab to space
set smartindent     " indent when
set tabstop=4       " tab width
set softtabstop=4   " backspace
set shiftwidth=4    " indent width
set mouse=a         " if I am lazy to go keyboard
set nu rnu          " relative line numbers
set cursorline

" Disable autocommenting
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"AutoPairs
let g:AutoPairsFlyMode = 1

"colorscheme
"set background=dark
set background=light
let g:gruvbox_bold = 1
let g:gruvbox_italic = 1
"let g:gruvbox_contrast_light = 1
let g:gruvbox_contrast_heavy = 1
:colorscheme gruvbox
