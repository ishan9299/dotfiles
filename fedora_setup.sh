#!/bin/bash
sudo dnf remove totem libreoffice-* rhythmbox firefox gnome-contacts gnome-maps
sudo dnf install neovim git chromium gnome-tweaks dconf-editor zsh geany tilix geany-plugins-vimode
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak remote-add --if-not-exists gnome-nightly https://nightly.gnome.org/gnome-nightly.flatpakrepo

