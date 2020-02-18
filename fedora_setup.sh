#!/bin/bash
sudo dnf remove totem libreoffice-* rhythmbox firefox
sudo dnf install neovim emacs git chromium
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    
