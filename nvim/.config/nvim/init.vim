"Relative Line number
set nu rnu

"Set Leader to Space
let mapleader = "\<Space>"

" Disable autocommenting
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Reload vimrc
nnoremap <leader>rc :source<Space>~/.config/nvim/init.vim<cr>
" Shortcut to config file
nnoremap <Leader>ec :edit ~/.config/nvim/init.vim<cr>

"disabling arrow keys
nnoremap <up>    <nop>
nnoremap <down>  <nop>
nnoremap <left>  <nop>
nnoremap <right> <nop>
inoremap <up>    <nop>
inoremap <down>  <nop>
inoremap <left>  <nop>
inoremap <right> <nop>

" Default Indentation
set autoindent
set expandtab       " expand tab to space
set smartindent     " indent when
set tabstop=4       " tab width
set softtabstop=4   " backspace
set shiftwidth=4    " indent width
set mouse=a         " if I am lazy to go keyboard
set cursorline

" Tab Stuff
nnoremap <Leader>tn :tabnew<cr>
nnoremap <Leader>tk :tabnext<cr>
nnoremap <Leader>tj :tabprev<cr>
nnoremap <Leader>th :tabfirst<cr>
nnoremap <Leader>tl :tablast<cr>

" Split Windows
nnoremap <Leader>hs :split<cr>
nnoremap <Leader>vs :vsplit<cr>

" copying to xclip
vmap <"y+> :!xclip -f -sel clip<CR>
map <"p+> :-1r !xclip -o -sel clip<CR>

" Windows
nnoremap <Leader>wl  <C-w>l
nnoremap <Leader>wk  <C-w>k
nnoremap <Leader>wj  <C-w>j
nnoremap <Leader>wh  <C-w>h
nnoremap <Leader>wd  :q<cr> 

"Extensions Vim Plug
call plug#begin('~/.config/nvim/plugged')
Plug 'jceb/vim-orgmode'
Plug 'vim-airline/vim-airline'
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline-themes'
Plug 'gruvbox-material/vim', {'as': 'gruvbox-material'}
Plug 'Valloric/YouCompleteMe'
Plug 'sheerun/vim-polyglot'
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdtree'
Plug 'easymotion/vim-easymotion'
call plug#end()

"AutoPairs
let g:AutoPairsFlyMode = 1

"YouCompleteMe
let g:ycm_use_clangd = 0
let g:ycm_show_diagnostics_ui = 1
let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '>>'
let g:ycm_enable_diagnostic_signs = 1
let g:ycm_enable_diagnostic_highlighting = 1

"Airline Theme
let g:airline_theme='gruvbox_material'
let g:Powerline_symbols = "fancy"
let g:Powerline_dividers_override = ["\Ue0b0","\Ue0b1","\Ue0b2","\Ue0b3"]
let g:Powerline_symbols_override = {'BRANCH': "\Ue0a0", 'LINE': "\Ue0a1", 'RO': "\Ue0a2"}
let g:airline_powerline_fonts = 1
let g:airline_right_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_left_alt_sep= ''
let g:airline_left_sep = ''

" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

"colorscheme
set termguicolors
set background=dark
let g:gruvbox_material_background = 'hard'
:colorscheme gruvbox-material

" Default Indentation
set autoindent
set expandtab       " expand tab to space
set smartindent     " indent when
set tabstop=4       " tab width
set softtabstop=4   " backspace
set shiftwidth=4    " indent width
set mouse=a         " if I am lazy to go keyboard
set cursorline


" tab stuff
nnoremap tn :tabnew<cr>
nnoremap tk :tabnext<cr>
nnoremap tj :tabprev<cr>
nnoremap th :tabfirst<cr>
nnoremap tl :tablast<cr>

" Automatically open NERDTree if Directory is open through vim 
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
" Close only if nerdtree open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"NERDtree toggle
map <f8> :NERDTreeToggle<CR>

" Easy motion
nmap <Leader>ss <Plug>(easymotion-overwin-f)

" Autoinstall Plug Nvim
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source ~/.config/nvim.init.vim
endif
