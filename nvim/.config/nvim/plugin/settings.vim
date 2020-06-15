" Default Indentation
set termguicolors
set t_Co=256                        " Support 256 colors
set expandtab                       " expand tab to space
set smartindent                     " indent when
set tabstop=4                       " tab width
set softtabstop=4                   " backspace
set shiftwidth=4                    " indent width
set mouse=a                         " if I am lazy to go keyboard
set nu rnu                          " relative line numbers
set hidden
set cursorline
set noshowmode
set completeopt=menuone,noinsert,noselect " for completion nvim
set shortmess+=c                      " for completion neovim
set list                              " show whitespace
set noemoji
set listchars=nbsp:⦸                  " CIRCLED REVERSE SOLIDUS (U+29B8, UTF-8: E2 A6 B8)
set listchars+=tab:▷┅                 " WHITE RIGHT-POINTING TRIANGLE (U+25B7, UTF-8: E2 96 B7)
set listchars+=extends:»              " RIGHT-POINTING DOUBLE ANGLE QUOTATION MARK (U+00BB, UTF-8: C2 BB)
set listchars+=precedes:«             " LEFT-POINTING DOUBLE ANGLE QUOTATION MARK (U+00AB, UTF-8: C2 AB)
set listchars+=trail:•                " BULLET (U+2022, UTF-8: E2 80 A2)
set formatoptions+=n                  " smart auto-indenting inside numbered lists
set formatoptions-=c
set formatoptions-=r
set formatoptions-=o
set hidden                            " allows you to hide buffers with unsaved changes without being prompted
set lazyredraw                        " don't bother updating screen during macro playback
set scrolloff=3                       " start scrolling 3 lines before edge of viewport
set shortmess+=I                      " no splash screen
set shortmess+=O                      " file-read message overwrites previous
set shortmess+=T                      " truncate non-file messages in middle
set shortmess+=W                      " don't echo "[w]"/"[written]" when writing
set shortmess+=a                      " use abbreviations in messages eg. `[RO]` instead of `[readonly]`
set shortmess+=o                      " overwrite file-written messages
set shortmess+=t                      " truncate file messages at start
set switchbuf=usetab                  " try to reuse windows/tabs when switching buffers
set wildmode=longest:full,full
set wildignore+=*.o,*.obj,*.bin,*.dll,*.exe
set wildignore+=*/.git/*,*/.svn/*,*/__pycache__/*,*/build/**
set wildignore+=*.pyc
set wildignore+=*.DS_Store
set wildignore+=*.aux,*.bbl,*.blg,*.brf,*.fls,*.fdb_latexmk,*.synctex.gz,*.pdf
set timeoutlen=500
set updatetime=800
set syntax=on
set matchpairs+=<:>,「:」
let g:loaded_netrw       = 1          " Disable netrw
let g:loaded_netrwPlugin = 1          " Disable netrw

if has('windows')
  set splitbelow                      " open horizontal splits below current window
endif

if has('vertsplit')
  set splitright                      " open vertical splits to the right of the current window
endif

if has('virtualedit')
  set virtualedit=block               " allow cursor to move where there is no text in visual block mode
endif

" colorscheme
let base16colorspace=256  " Access colors present in 256 colorspace
set bg=dark
colorscheme nord
hi Vertsplit guibg=NONE guifg=NONE
set fillchars=vert:\ 

" Python {{{
" This must be here becasue it makes loading vim VERY SLOW otherwise
if has('nvim')
  let g:python_host_skip_check = 1
  let g:python3_host_skip_check = 1
  if executable('python3')
    let g:python3_host_prog = exepath('python3')
  endif
endif
" }}}

" Transperency
" hi! Normal ctermbg=NONE guibg=NONE 
" hi! NonText ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE 
