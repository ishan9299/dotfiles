#!/bin/sh

aur-wm()
{
    yay --noconfirm --needed -S python-ueberzug tdrop ranger-git brave-bin polybar-git ttf-nerd-fonts-hack-complete-git nerd-fonts-fira-code tela-icon-theme-git i3lock-fancy-git lightdm-webkit-theme-litarvan
}

aur-gnome()
{
    yay --noconfirm -S brave-bin nerd-fonts-fira-code ttf-nerd-fonts-hack-complete-git
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

gnome()
{
    package="gnome gnome-tweaks dconf lollypop vim emacs zsh tilix sushi python-nautilus"
    sudo pacman -S $package
}

if ! pacman -Q yay;
then
    git clone https://aur.archlinux.org/yay-bin.git ~/.aur
    cd yay-bin
    makepkg -si
    sudo sed -i "s/#MAKEFLAGS=\"-j2\"/MAKEFLAGS=\"-j$(nproc)\"/"
fi

echo " 1.Bspwm 2.Gnome "
echo " Enter the options "
read option
if [ option == "1"]
then
    aur-wm
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
    aur-gnome
    gnome
    cd ~/dotfiles
    echo "Creating symlinks"
    stow systemd emacs dconf systemd
    dconf load / < ~/.config/dconf/user.conf
    systemctl enable --user emacs
fi

sudo pacman -Rns $(pacman -Qqtd)

if [ ! -d ~/.oh-my-zsh ]
then
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
    sed -i -e "s/git/git vi-mode zsh-syntax-highlighting zsh-completion/" -e "s/robbyrussel/powerlevel10k\/powerlevel10k/" .zshrc
    echo "_comp_options+=(globdots)" >> ~/.zshrc # autocompletion shows hidden files
fi

sudo sh -c "$(curl -fsSL https://raw.githubusercontent.com/KaizIqbal/Bibata_Cursor/master/Bibata.sh)"

echo "do you want make a git profile ? (y/n) "
read ans
if [ ans == "y" ]
then
    echo " Enter the name for git "
    read name
    echo " Enter the email for git "
    read email

    git config --global user.name $name
    git config --global user.email $email
fi
# https://wifilogin.myion.in/?login=1&mac=vlan146-10th-Block&page=status&link-login-only=http://10.146.0.2/login&link-logout=http://10.146.0.2/logout&uname=180911246&interface-name=vlan146-10th-Block
