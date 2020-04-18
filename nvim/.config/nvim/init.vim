" For the flatpak neovim put the config in '$HOME/.var/app/io.neovim.nvim/config/nvim/init.vim'
" For the flatpak neovim put the plug in '$HOME/.var/app/io.neovim.nvim/data/nvim/site/autoload/plug.vim'

"Relative Line number
set nu rnu

"Set Leader to Space
let mapleader = "\<Space>"

" Disable autocommenting
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Reload vimrc
" nnoremap <leader>rc :source<Space>~/.var/app/io.neovim.nvim/config/nvim/init.vim<cr>
nnoremap <leader>rc :source<Space> ~/.config/nvim/init.vim<cr>
" Shortcut to config file
" nnoremap <Leader>ec :edit ~/.var/app/io.neovim.nvim/config/nvim/init.vim<cr>
nnoremap <leader>ec :source<Space> ~/.config/nvim/init.vim<cr>

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
nnoremap <Leader>ws :split<cr>
nnoremap <Leader>wv :vsplit<cr>

" Windows
nnoremap <Leader>wl  <C-w>l
nnoremap <Leader>wk  <C-w>k
nnoremap <Leader>wj  <C-w>j
nnoremap <Leader>wh  <C-w>h
nnoremap <Leader>wd  :q<cr> 

"Extensions Vim Plug
"call plug#begin('~/.var/app/io.neovim.nvim/config/nvim/plugged')
call plug#begin('~/.config/nvim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'jiangmiao/auto-pairs'
Plug 'sheerun/vim-polyglot'
Plug 'easymotion/vim-easymotion'
call plug#end()

"AutoPairs
let g:AutoPairsFlyMode = 1

"Airline Theme
let g:airline_theme='hybrid'
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
"set background=light
:colorscheme hybrid_reverse
":colorscheme hybrid_material
let g:enable_bold_font = 1
let g:hybrid_transparent_background = 0
let g:enable_italic_font = 1

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

" Easy motion
nmap <Leader>ss <Plug>(easymotion-overwin-f)

autocmd filetype c nnoremap <F5> :w <bar> exec '!gcc '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
autocmd filetype cpp nnoremap <F5> :w <bar> exec '!g++ '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
