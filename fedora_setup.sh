#!/bin/bash
sudo dnf remove totem libreoffice-* rhythmbox firefox gnome-contacts gnome-maps
sudo dnf install neovim emacs git chromium gnome-tweaks dconf-editor zsh
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    
