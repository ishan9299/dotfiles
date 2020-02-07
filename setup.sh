#!/usr/bin/env zsh

aurwm()
{
    yay --noconfirm --needed -S python-ueberzug tdrop ranger-git brave-bin polybar-git tela-icon-theme-git i3lock-fancy-git lightdm-webkit-theme-litarvan ttf-ms-fonts ttf-iosevka
}

aurgnome()
{
    yay --noconfirm -S brave-bin pop-icon-theme-git python-ueberzug ranger-git ttf-ms-fonts ttf-iosevka gnome-music-git
}

# Some pacakges are required by my emacs config like sbcl clang llvm cmake remove these if u dont use emacs 
# atool and avfs for ranger extracting files and highlight for syntax highlight in previews for ranger ffmpegthumnailer for vedios
bspwm()
{
    package="bspwm sxhkd nitrogen mate-power-manager xclip feh zsh  xorg-xprop xorg-xwininfo xdotool mpd mpv mpc ncmpcpp alacritty stow rofi sbcl "
    package="$package picom git network-manager-applet flatpak ttf-fira-code ttf-fira-sans ttf-font-awesome emacs xorg-xsetroot lxappearance-gtk3 "
    package="$package python-pywal dunst gtk-engines llvm clang cmake materia-gtk-theme noto-fonts-emoji noto-fonts xss-lock atool avfs dosbox "
    package="$package lightdm lightdm-webkit2-greeter fzf materia-gtk-theme nvidia nvidia-prime xorg-server poppler zathura highlight zathura-pdf-poppler"
    sudo pacman --noconfirm -S $(echo $package)
}

#ranger is also in gnome it's too convienient
# added ncmpcpp mpd if you want to show off
gnome()
{
    package="evince file-roller gdm gnome-books gnome-control-center gnome-dictionary gnome-weather grilo-plugins gvfs gvfs-mtp  zsh tilix sushi python-nautilus celluloid"
    package="$package gnome-calculator gnome-calendar gnome-characters gnome-clocks gnome-color-manager gnome-disk-utility gnome-settings-daemon"
    package="$package gnome-font-viewer gnome-keyring gnome-menus gnome-screenshot gnome-session gnome-shell gnome-themes-extra gnome-user-share"
    package="$package gnome-shell-extensions gvfs-google mousetweaks mutter nautilus networkmanager orca rygel sushi tracker tracker-miners vino xdg-user-dirs-gtk gnome-tweaks emacs"
    package="$package git dosbox xclip dconf kitty easytag atool avfs noto-fonts-emoji stow mpd mpc ncmpcpp noto-fonts sbcl clang llvm cmake "
    package="$package fzf python-pynvim flatpak seahorse-nautilus ttf-font-awesome neovim nvidia nvidia-prime ttf-fira-code ttf-fira-sans "
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
    echo "-Installing Gnome"
    aurgnome
    gnome
    cd $HOME/dotfiles
    echo "-Creating Symlinks"
    rm $HOME/.zshrc
    stow systemd emacs dconf systemd ranger mpv mpd ncmpcpp nvim
    dconf load / < $HOME/.config/dconf/user.conf
    systemctl enable --user mpd.service
    systemctl enable --user emacs
    sudo systemctl enable gdm.service
elif [[ option=="1" ]]
then
    echo "-Installing Bspwm" | sed 's/-/ /'
    aurbspwm
    bspwm
    cd $HOME/dotfiles
    echo "-Creating Symlinks" | sed 's/-/ /'
    rm $HOME/.zshrc
    stow systemd emacs systemd ranger mpv mpd ncmpcpp nvim kitty polybar bspwm sxhkd rofi wal dunst picom
    dconf load / < $HOME/.config/dconf/user.conf
    systemctl enable --user mpd.service
    systemctl enable --user emacs
    sudo systemctl enable lightdm.service
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
fi

if [[ ! -d $HOME/.oh-my-zsh ]]
then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" &
    wait
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=$HOME/.oh-my-zsh/custom}/plugins/zsh-completions
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
fi
sed -i "s/(git)/(git vi-mode fzf zsh-syntax-highlighting zsh-completions)/;s/\"robbyrussell\"/powerlevel10k\/powerlevel10k/" $HOME/.zshrc

# showing hidden files
if ! grep --quiet "_comp_options+=(globdots)" $HOME/.zshrc
then
    echo "already shows hidden files"
else
    echo "_comp_options+=(globdots)" >> $HOME/.zshrc # autocompletion shows hidden files
fi
