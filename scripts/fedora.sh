#!/bin/bash

sudo dnf install exa fish 

if [[ ! -a $HOME/.gitconfig ]]
then
    echo "-Enter the name for git " | sed 's/-/ /'
    read name
    echo "-Enter the email for git " | sed 's/-/ /'
    read email

    git config --global user.name $name
    git config --global user.email $email
    git config --global core.editor nvim
fi

if [[ ! -d $HOME/.config/zsh ]]
then
    mkdir $HOME/.config/zsh
    cd $HOME/.config/zsh
    sudo curl -fsSL https://starship.rs/install.sh | bash
    git clone https://github.com/zsh-users/zsh-completions.git
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
    wget https://raw.githubusercontent.com/junegunn/fzf/master/shell/key-bindings.zsh
    wget https://raw.githubusercontent.com/junegunn/fzf/master/shell/completion.zsh
fi
