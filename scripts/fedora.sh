#!/bin/bash
sudo dnf remove totem libreoffice-* rhythmbox gnome-contacts gnome-maps gnome-boxes
sudo dnf install neovim git gnome-tweaks dconf-editor zsh tilix stow ranger
stow ~/dotfiles/zsh
dconf load / < $HOME/dotfiles/dconf/gnome.config

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


# Bibata Cursors
if [[ ! -d /usr/share/icons/Bibata_Amber ]]
then
    sudo sh -c "$(curl -fsSL https://raw.githubusercontent.com/KaizIqbal/Bibata_Cursor/master/Bibata.sh)"
fi

# Flatpak repo
flatpak remote-add --if-not-exists flathub-beta --from https://flathub.org/beta-repo/flathub-beta.flatpakrepo
flatpak remote-add --if-not-exists kdeapps --from https://distribute.kde.org/kdeapps.flatpakrepo
flatpak remote-add --if-not-exists flathub --from https://flathub.org/repo/flathub.flatpakrepo
flatpak remote-add --if-not-exists gnome-nightly --from https://nightly.gnome.org/gnome-nightly.flatpakrepo
