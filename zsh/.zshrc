# prompt
eval "$(starship init zsh)"

# history
SAVEHIST=100
HISTFILE=~/.zsh_history

# Highlight the selection
zstyle ':completion:*' menu select
zmodload zsh/complist

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# vi-mode
set -o vi

typeset -U PATH path
path=("$HOME/.local/bin" "/var/lib/flatpak/exports/bin" "$path[@]")
export PATH

# compinit 
autoload -U compinit && compinit
autoload -Uz tetriscurses

# Include hidden files in autocomplete:
_comp_options+=(globdots)

# youtube-dl
autoload -Uz bracketed-paste-magic
zle -N bracketed-paste bracketed-paste-magic
autoload -Uz url-quote-magic
zle -N self-insert url-quote-magic

# alias
alias ll="lsd -la"

bindkey -s '^o' '. ranger\n'  # zsh

# Default EDITOR
export EDITOR=nvim
export TERMINAL=tilix

# extensions
fpath=($HOME/.config/zsh/zsh-completions/src $fpath)
# keeping the syntax highlighting in last as it is said in the github page
source $HOME/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

