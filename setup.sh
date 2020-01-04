#!/bin/sh

aur()
{
    if [ ! -r /usr/bin/ueberzug ]
    then
       str="python-ueberzug tdrop"
    fi

    if [ ! -r /usr/bin/ranger ]
    then
        str="$str ranger-git"
    fi

    if [ ! -r /usr/bin/brave ]
    then
        str="$str brave-bin"
    fi

    if [ ! -r /usr/bin/polybar ]
    then
        str="$str polybar-git"
    fi

    echo "Installing the packages"
    echo $str
    yay -S $(echo $str)
    normal
}

normal()
{
    if [ ! -r /usr/bin/bspwm ]
    then
       str="bspwm sxhkd"
    fi

    if [ ! -r /usr/bin/xfsettingsd ]
    then
        str="$str xfce4-settings xfce4-power-manager"
    fi

    if [ ! -r /usr/bin/nitrogen ]
    then
        str="$str nitrogen feh"
    fi

    if [ ! -r /usr/bin/wal ]
    then
        str="$str python-pywal"
    fi

    if [ ! -r /usr/bin/xprop ]
    then
        str="$str xorg-xprop xorg-xwinfo xdotool"
    fi

    if [ ! -r /usr/bin/mpd ]
    then
        str="$str mpd mpv mpc ncmpcpp"
    fi

    if [ ! -r /usr/bin/alacritty ]
    then
        str="$str alacritty"
    fi

    if [ ! /usr/bin/stow ]
    then
        str="$str stow"
    fi

    if [ ! /usr/bin/rofi ]
    then
        str="$str rofi dunst picom"
    fi

    echo "Installing the packages"
    echo $str
    sudo pacman -S $(echo $str)
}

if [ -r /usr/bin/yay ]
then
    aur
else
    git clone https://aur.archlinux.org/yay-bin.git
    cd yay-bin
    makepkg -si
    aur
fi

echo "Creating symlinks"
cd ~/dotfiles
stow alacritty dunst lock ncmpcpp rofi bspwm sxhkd doom-emacs mpd mpv polybar ranger picom vim

touch ~/.config/mpd/pid
touch ~/.config/mpd/log
touch ~/.config/mpd/playlist
touch ~/.config/mpd/state
touch ~/.config/mpd/databse
