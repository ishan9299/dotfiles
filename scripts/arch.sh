gnome()
{
    package="gnome-shell gdm nautilus flatpak dosbox alacritty kitty tilix chromium tlp xdg-user-dirs-gtk xdg-user-dirs"
    package="$package gnome-disk-utility noto-fonts-emoji nvidia xclip noto-fonts-extra gnome-control-center wget"
    sudo pacman --noconfirm -S $(echo $package)
}

echo "-Installing Gnome" | sed 's/-/ /g'
gnome
sudo sed -i "s/#MAKEFLAGS=\"-j2\"/MAKEFLAGS=\"-j$(nproc)\"/" /etc/makepkg.conf
systemctl enable --user mpd.service
sudo systemctl enable gdm.service
sudo systemctl enable tlp.service

echo "-Removing the orphan packages" | sed 's/-/ /'
sudo pacman --noconfirm -Rns $(pacman -Qqtd)

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

if pacman -Q flatpak
then
    flatpak remote-add flathub-beta https://flathub.org/beta-repo/flathub-beta.flatpakrepo
fi
