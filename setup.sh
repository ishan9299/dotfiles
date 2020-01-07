#!/bin/sh

aur()
{
    yay --noconfirm --needed -S python-ueberzug tdrop ranger-git brave-bin polybar-git nerd-fonts-fira-code
    normal
}

normal()
{
    sudo pacman --noconfirm -S bspwm sxhkd nitrogen mate-power-manager feh zsh python-pywal xorg-xprop xorg-xwininfo xdotool mpd mpv mpc ncmpcpp alacritty stow rofi dunst picom git network-manager-applet ttf-fira-code ttf-fira-sans ttf-font-awesome emacs
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

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions

git clone https://github.com/hlissner/doom-emacs ~/.emacs.d
~/.emacs.d/bin/doom install

