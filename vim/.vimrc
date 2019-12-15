"relative line numbering
:set nu rnu

"colorscheme
g:gruvbox_contrast_dark
colorscheme gruvbox

"disabling arrow keys
nnoremap <up>    <nop>
nnoremap <down>  <nop>
nnoremap <left>  <nop>
nnoremap <right> <nop>
inoremap <up>    <nop>
inoremap <down>  <nop>
inoremap <left>  <nop>
inoremap <right> <nop>

"syntax 
:syntax on

"Tab width fixed
set tabstop=4

"Extensions Vim Plug
call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
call plug#end()


" Default Indentation
set autoindent
set expandtab       " expand tab to space
set smartindent     " indent when
set tabstop=4       " tab width
set softtabstop=4   " backspace
set shiftwidth=4    " indent width


"Automatic vim Plug installation
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


if !has('nvim')
   set ttymouse=xterm2
endif 
