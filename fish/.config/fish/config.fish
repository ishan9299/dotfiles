set PATH $HOME/.local/bin $HOME/.local/nvim/bin $HOME/.local/npm/bin $PATH
set PATH /var/lib/flatpak/exports/bin $PATH

set -gx EDITOR nvim

source $HOME/.config/fish/functions/fzf_key_bindings.fish
source $HOME/.config/fish/colorschemes/base16-default-dark.fish

bass source $HOME/.nix-profile/etc/profile.d/nix.sh

starship init fish | source
