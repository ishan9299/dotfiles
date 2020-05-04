" For the flatpak neovim put the config in '$HOME/.var/app/io.neovim.nvim/config/nvim/init.vim'
" For the flatpak neovim put the plug in '$HOME/.var/app/io.neovim.nvim/data/nvim/site/autoload/plug.vim'
" nnoremap <leader>rc :source<Space>~/.var/app/io.neovim.nvim/config/nvim/init.vim<cr>
" nnoremap <Leader>ec :edit ~/.var/app/io.neovim.nvim/config/nvim/init.vim<cr>

source $HOME/.config/nvim/vim-plug/plugins.vim
source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/general/keys.vim
source $HOME/.config/nvim/general/terminal.vim
source $HOME/.config/nvim/plugin-configs/airline/airline.vim
source $HOME/.config/nvim/plugin-configs/colors/rainbow.vim
source $HOME/.config/nvim/plugin-configs/fzf/fzf.vim
source $HOME/.config/nvim/plugin-configs/coc/coc.vim
luafile $HOME/.config/nvim/plugin-configs/colors/colorizer.lua
