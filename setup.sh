#!/usr/bin/env bash

aurwm()
{
    yay --noconfirm --needed -S python-ueberzug tdrop ranger-git brave-bin polybar-git ttf-nerd-fonts-hack-complete-git nerd-fonts-fira-code tela-icon-theme-git i3lock-fancy-git lightdm-webkit-theme-litarvan
}

aurgnome()
{
    yay --noconfirm -S brave-bin nerd-fonts-fira-code ttf-nerd-fonts-hack-complete-git pop-icon-theme-git python-ueberzug ranger-git
}

# Some pacakges are required by my emacs config like sbcl clang llvm cmake remove these if u dont use emacs 
# atool and avfs for ranger extracting files and highlight for syntax highlight in previews for ranger ffmpegthumnailer for vedios
bspwm()
{
    package="bspwm sxhkd nitrogen mate-power-manager feh zsh  xorg-xprop xorg-xwininfo xdotool mpd mpv mpc ncmpcpp alacritty stow rofi sbcl"
    package="$package picom git network-manager-applet ttf-fira-code ttf-fira-sans ttf-font-awesome emacs xorg-xsetroot lxappearance-gtk3"
    package="$package python-pywal dunst gtk-engines llvm clang cmake materia-gtk-theme noto-fonts-emoji xss-lock atool avfs dosbox"
    package="$package lightdm lightdm-webkit2-greeter materia-gtk-theme nvidia nvidia-prime xorg-server poppler zathura highlight zathura-pdf-poppler"
    sudo pacman --noconfirm -S $package
}

#ranger is also in gnome it's too convienient
# added ncmpcpp mpd if you want to show off
gnome()
{
    package="gnome gnome-tweaks dconf lollypop vim emacs zsh tilix sushi python-nautilus seahorse seahorse-nautilus celluloid nvidia nvidia-prime ttf-fira-code ttf-fira-sans"
    package="$package git dosbox kitty python-pywal easytag atool avfs noto-fonts-emoji stow mpd mpc ncmpcpp ttf-font-awesome"
    sudo pacman -S $package
}

if ! pacman -Q yay;
then
    git clone https://aur.archlinux.org/yay-bin.git ~/.aur
    cd ~/.aur
    makepkg -si
    sudo sed -i "s/#MAKEFLAGS=\"-j2\"/MAKEFLAGS=\"-j$(nproc)\"/"
fi

echo " 1.Bspwm 2.Gnome "
echo " Enter the options "
read option
if [[ option == "1" ]]
then
    aurwm
    bspwm
    cd ~/dotfiles
    echo "Creating symlinks"
    stow dunst ncmpcpp rofi bspwm sxhkd emacs mpd mpv polybar ranger picom vim systemd 
    touch ~/.config/mpd/pid
    touch ~/.config/mpd/log
    touch ~/.config/mpd/playlist
    touch ~/.config/mpd/state
    touch ~/.config/mpd/databse
    systemctl enable --user mpd.service
    systemctl enable --user emacs
else
    aurgnome
    gnome
    cd ~/dotfiles
    echo "Creating symlinks"
    stow systemd emacs dconf systemd ranger mpv mpd ncmpcpp 
    dconf load / < ~/.config/dconf/user.conf
    systemctl enable --user mpd.service
    systemctl enable --user emacs
    sudo systemctl enable gdm.service
fi

echo "Removing the orphan packages"
sudo pacman --noconfirm -Rns $(pacman -Qqtd)

echo "Installing Bibata"
if [[ ! -d Bibata_Amber ]]
then
	sudo sh -c "$(curl -fsSL https://raw.githubusercontent.com/KaizIqbal/Bibata_Cursor/master/Bibata.sh)"
fi

if [[ ! -a ~/.gitconfig ]]
then
    echo " Enter the name for git "
    read name
    echo " Enter the email for git "
    read email

    git config --global user.name $name
    git config --global user.email $email
fi

if [[ ! -d ~/.oh-my-zsh ]]
then
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" 
fi
