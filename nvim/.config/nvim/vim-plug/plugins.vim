
" Auto Install Plug
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


"Extensions Vim Plug
"call plug#begin('~/.var/app/io.neovim.nvim/config/nvim/plugged')
call plug#begin('~/.config/nvim/plugged')
Plug 'norcalli/nvim-colorizer.lua'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'chriskempson/base16-vim'
Plug 'tomasiser/vim-code-dark'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'mike-hearn/base16-vim-lightline'
Plug 'arcticicestudio/nord-vim'
Plug 'airblade/vim-rooter'
Plug 'morhetz/gruvbox'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/goyo.vim'
call plug#end()


" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
