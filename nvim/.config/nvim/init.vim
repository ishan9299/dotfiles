" Leader key
nnoremap <Space> <Nop>
let mapleader="\<Space>"
let maplocalleader="\\"

" Auto Install Plug
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


"Extensions Vim Plug
"call plug#begin('~/.var/app/io.neovim.nvim/config/nvim/plugged')
call plug#begin('~/.config/nvim/plugged')
" Coding
Plug 'neovim/nvim-lsp'
Plug 'haorenW1025/completion-nvim'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'duggiefresh/vim-easydir'
Plug 'Plasticboy/vim-markdown'
" Projects
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'
Plug 'junegunn/goyo.vim', { 'for': ['markdown']}
Plug 'justinmk/vim-dirvish'
Plug 'kristijanhusak/vim-dirvish-git'
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'fcpg/vim-waikiki'
" Color Schemes
Plug 'chriskempson/base16-vim'
Plug 'morhetz/gruvbox'
Plug 'tomasiser/vim-code-dark'
Plug 'arcticicestudio/nord-vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'sheerun/vim-polyglot'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'sonph/onehalf'
call plug#end()


" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
