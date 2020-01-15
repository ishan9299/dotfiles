#!/bin/sh

aur()
{
    yay --noconfirm --needed -S python-ueberzug tdrop ranger-git brave-bin polybar-git nerd-fonts-fira-code tela-icon-theme-git i3lock-fancy-git lightdm-webkit-theme-litarvan
}

normal()
{
    package="bspwm sxhkd nitrogen mate-power-manager feh zsh  xorg-xprop xorg-xwininfo xdotool mpd mpv mpc ncmpcpp alacritty stow rofi sbcl"
    package="$package picom git network-manager-applet ttf-fira-code ttf-fira-sans ttf-font-awesome emacs xorg-xsetroot lxappearance-gtk3"
    package="$package python-pywal dunst gtk-engines llvm clang cmake materia-gtk-theme noto-fonts-emoji xss-lock"
    package="$package lightdm lightdm-webkit2-greeter materia-gtk-theme nvidia nvidia-prime xorg-server poppler zathura highlight zathura-pdf-poppler"
    sudo pacman --noconfirm -S $package
}

if ! pacman -Q yay;
then
    git clone https://aur.archlinux.org/yay-bin.git ~/
    cd yay-bin
    makepkg -si
    aur
fi
normal

echo "Creating symlinks"
cd ~/dotfiles
stow alacritty dunst lock ncmpcpp rofi bspwm sxhkd emacs mpd mpv polybar ranger picom vim systemd

touch ~/.config/mpd/pid
touch ~/.config/mpd/log
touch ~/.config/mpd/playlist
touch ~/.config/mpd/state
touch ~/.config/mpd/databse
systemctl enable --user mpd.service
systemctl enable --user emacs

if [ ! -d ~/.oh-my-zsh ]
then
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions
fi

sudo sh -c "$(curl -fsSL https://raw.githubusercontent.com/KaizIqbal/Bibata_Cursor/master/Bibata.sh)"

echo " Enter the name for git "
read name
echo " Enter the email for git "
read email

git config --global user.name $name
git config --global user.email $email

# https://wifilogin.myion.in/?login=1&mac=vlan146-10th-Block&page=status&link-login-only=http://10.146.0.2/login&link-logout=http://10.146.0.2/logout&uname=180911246&interface-name=vlan146-10th-Block
