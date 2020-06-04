#!/bin/sh
sudo rpm-ostree install exa fd-find tilix kid3-qt fish fzf htop stow tmux

# Flatpak repo
flatpak remote-add --if-not-exists flathub-beta --from https://flathub.org/beta-repo/flathub-beta.flatpakrepo
flatpak remote-add --if-not-exists kdeapps --from https://distribute.kde.org/kdeapps.flatpakrepo
flatpak remote-add --if-not-exists flathub --from https://flathub.org/repo/flathub.flatpakrepo
flatpak remote-add --if-not-exists gnome-nightly --from https://nightly.gnome.org/gnome-nightly.flatpakrepo
