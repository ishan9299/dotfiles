#!/bin/bash

sudo curl -fsSL https://starship.rs/install.sh | bash
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
sudo dnf -y upgrade && sudo dnf -y install exa fish fzf htop file clang gcc-c++ npm code libX11-xcb glibc-langpack-en fd-find gdb
