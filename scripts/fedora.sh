#!/bin/bash
sudo dnf remove totem libreoffice-* rhythmbox gnome-contacts gnome-maps gnome-boxes
sudo dnf install neovim git gnome-tweaks dconf-editor zsh tilix stow ranger
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak remote-add --if-not-exists gnome-nightly https://nightly.gnome.org/gnome-nightly.flatpakrepo

# zsh config
mkdir $HOME/.config/zsh
cd $HOME/.config/zsh
sudo curl -fsSL https://startship.rs/install.sh | bash
git clone https://github.com/zsh-users/zsh-completions.git
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
wget https://raw.githubusercontent.com/junegunn/fzf/master/shell/key-bindings.zsh
wget https://raw.githubusercontent.com/junegunn/fzf/master/shell/completion.zsh

# Bibata Cursors
if [[ ! -d /usr/share/icons/Bibata_Amber ]]
then
    sudo sh -c "$(curl -fsSL https://raw.githubusercontent.com/KaizIqbal/Bibata_Cursor/master/Bibata.sh)"
fi

