" Leader key
nnoremap <Space> <Nop>
let mapleader="\<Space>"
let maplocalleader="\\"

" Turn off most of the features of this plug-in; I really just want the folding.
let g:vim_markdown_override_foldtext=0
let g:vim_markdown_no_default_key_mappings=1
let g:vim_markdown_emphasis_multiline=0
let g:vim_markdown_conceal=0
let g:vim_markdown_conceal_code_blocks = 0
let g:vim_markdown_frontmatter=1
let g:vim_markdown_new_list_item_indent=0

" Load minpac
packadd minpac

if !exists('*minpac#init')
  " Settings for plugin-less environment.
else
  " minpac is available.
  call minpac#init()
  call minpac#add('k-takata/minpac', {'type': 'opt'})

  " Additional plugins here.
  call minpac#add('tpope/vim-surround')
  call minpac#add('tpope/vim-commentary')
  call minpac#add('tpope/vim-fugitive')
  call minpac#add('tpope/vim-repeat')
  call minpac#add('morhetz/gruvbox')
  call minpac#add('mhartington/oceanic-next')
  call minpac#add('arcticicestudio/nord-vim')
  call minpac#add('sheerun/vim-polyglot')
  call minpac#add('duggiefresh/vim-easydir')
  call minpac#add('haorenW1025/completion-nvim')
  call minpac#add('neovim/nvim-lsp')
  call minpac#add('justinmk/vim-dirvish')
  call minpac#add('SirVer/ultisnips')
  call minpac#add('honza/vim-snippets')
  call minpac#add('Plasticboy/vim-markdown')
  call minpac#add('junegunn/fzf')
  call minpac#add('junegunn/fzf.vim')
  call minpac#add('norcalli/nvim-colorizer.lua')
  call minpac#add('fcpg/vim-waikiki')
  call minpac#add('tpope/vim-eunuch',{'type': 'opt'})
  call minpac#add('junegunn/goyo.vim',{'type': 'opt'})
  call minpac#add('glacambre/firenvim', { 'type': 'opt', 'do': 'packadd firenvim | call firenvim#install(0)'})

  " Load some plugins on coditions only
  if exists('g:started_by_firenvim')
    packadd firenvim
  endif
  if &ft ==# "markdown"
      packadd goyo.vim
      packadd vim-waikiki
  endif
endif
