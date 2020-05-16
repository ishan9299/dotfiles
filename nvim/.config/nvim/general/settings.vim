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

"colorscheme
set bg=light
:colorscheme gruvbox

function! Light()
    echom "set bg=light"
    set bg=light
    let g:gruvbox_bold = 1
    let g:gruvbox_italic = 1
    let g:gruvbox_contrast_heavy = 1
    " let g:gruvbox_contrast_light=1
    colorscheme gruvbox
endfunction

function! Dark()
    echom "set bg=dark"
    set bg=dark
    let g:gruvbox_bold = 1
    let g:gruvbox_italic = 1
    let g:gruvbox_contrast_heavy = 1
    " let g:gruvbox_contrast_light=1
    colorscheme gruvbox
endfunction

function! ToggleLightDark()
  if &bg ==# "light"
    call Dark()
  else
    call Light()
  endif
endfunction
