set PATH $HOME/.local/bin $HOME/.local/nvim/bin $HOME/.local/npm/bin $PATH
set PATH /var/lib/flatpak/exports/bin $PATH

set -gx EDITOR nvim

source $HOME/.config/fish/functions/fzf_key_bindings.fish
source $HOME/.config/fish/colorschemes/base16-default-dark.fish

starship init fish | source
