set PATH $HOME/.local/bin $HOME/.local/nvim/bin $HOME/.local/npm/bin $PATH

set -gx EDITOR nvim

source $HOME/.config/fish/functions/fzf_key_bindings.fish

starship init fish | source
