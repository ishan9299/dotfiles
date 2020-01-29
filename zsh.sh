#!/usr/bin/env bash
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting 
    git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions 
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k 
    sed -i "s/(git)/(git vi-mode fzf zsh-syntax-highlighting zsh-completions)/;s/\"robbyrussell\"/powerlevel10k\/powerlevel10k/" ~/.zshrc 
#    echo "_comp_options+=(globdots)" >> ~/.zshrc # autocompletion shows hidden files
