#!/usr/bin/env zsh

aurwm()
{
    yay --noconfirm --needed -S python-ueberzug tdrop ranger-git polybar-git tela-icon-theme-git i3lock-fancy-git lightdm-webkit-theme-litarvan ttf-ms-fonts ttf-iosevka 
}

aurgnome()
{
    yay --noconfirm -S ttf-ms-fonts ttf-iosevka 
}

# Some pacakges are required by my emacs config like sbcl clang llvm cmake remove these if u dont use emacs 
# atool and avfs for ranger extracting files and highlight for syntax highlight in previews for ranger ffmpegthumnailer for vedios
bspwm()
{
    package="bspwm sxhkd nitrogen mate-power-manager xclip feh zsh  xorg-xprop xorg-xwininfo xdotool mpd mpv mpc ncmpcpp alacritty stow rofi "
    package="$package picom git network-manager-applet flatpak ttf-fira-code ttf-fira-sans ttf-font-awesome xorg-xsetroot lxappearance-gtk3 tlp"
    package="$package python-pywal dunst gtk-engines materia-gtk-theme noto-fonts-emoji noto-fonts xss-lock atool avfs dosbox bumblebee"
    package="$package lightdm lightdm-webkit2-greeter fzf materia-gtk-theme nvidia xorg-server poppler zathura highlight zathura-pdf-poppler wget"
    sudo pacman --noconfirm -S $(echo $package)
}

# ranger is also in gnome it's too convienient
# added ncmpcpp mpd if you want to show off
gnome()
{
    package="gnome-shell gdm nautilus ranger neovim flatpak fzf stow zsh dosbox alacritty tilix pipewire firefox tlp bumblebee xdg-user-dirs-gtk xdg-user-dirs"
    package="$package gnome-disk-utility gnome-software gnome-weather wl-clipboard noto-fonts-emoji nvidia gnome-terminal noto-fonts-extra gnome-control-center wget"
    package="$package python-nautilus seahorse-nautilus" 
    sudo pacman --noconfirm -S $(echo $package)
}

if ! pacman -Q yay;
then
    git clone https://aur.archlinux.org/yay-bin.git $HOME/.aur
    cd $HOME/.aur
    makepkg -si
    sudo sed -i "s/#MAKEFLAGS=\"-j2\"/MAKEFLAGS=\"-j$(nproc)\"/" /etc/makepkg.conf
fi

echo "-1.Bspwm-2.Gnome " | sed 's/-/ /g' 
echo "-Enter the options " | sed 's/-/ /g'
read option
if [[ option=="2" ]]
then
    echo "-Installing Gnome" | sed 's/-/ /g'
    aurgnome
    gnome
    cd $HOME/dotfiles
    echo "-Creating Symlinks"
    rm $HOME/.zshrc
    stow systemd systemd ranger mpv mpd ncmpcpp nvim doom zsh
    dconf load / < $HOME/dotfiles/dconf/gnome.config
    systemctl enable --user mpd.service
    sudo systemctl enable gdm.service
    sudo systemctl enable bumblebeed.service
    sudo systemctl enable tlp.service
    sudo gpasswd $(whoami) bumblebee
elif [[ option=="1" ]]
then
    echo "-Installing Bspwm" | sed 's/-/ /'
    aurbspwm
    bspwm
    cd $HOME/dotfiles
    echo "-Creating Symlinks" | sed 's/-/ /'
    rm $HOME/.zshrc
    stow systemd ranger mpv mpd ncmpcpp nvim alacritty polybar bspwm sxhkd rofi wal dunst picom zsh
    dconf load / < $HOME/.config/dconf/user.conf
    systemctl enable --user mpd.service
    sudo systemctl enable lightdm.service
    sudo systemctl enable bumblebeed.service
    sudo systemctl enable tlp.service
    sudo gpasswd $(whoami) bumblebee
fi

echo "-Removing the orphan packages" | sed 's/-/ /'
sudo pacman --noconfirm -Rns $(pacman -Qqtd)
echo "-Installing Bibata" | sed 's/-/ /'
if [[ ! -d /usr/share/icons/Bibata_Amber ]]
then
    sudo sh -c "$(curl -fsSL https://raw.githubusercontent.com/KaizIqbal/Bibata_Cursor/master/Bibata.sh)"
fi

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
fi

if pacman -Q snapper;
then
    yay -S snapper-gui
    sudo systemctl enable snapper-timeline.timer
    sudo systemctl enable snapper-cleanup.timer
fi

if pacman -Q flatpak
then
    flatpak remote-add flathub-beta https://flathub.org/beta-repo/flathub-beta.flatpakrepo
    flatpak remote-add --if-not-exists kdeapps --from https://distribute.kde.org/kdeapps.flatpakrepo
fi

