#!/usr/bin/env zsh

aurwm()
{
    yay --noconfirm --needed -S python-ueberzug tdrop ranger-git brave-bin polybar-git ttf-nerd-fonts-hack-complete-git nerd-fonts-fira-code tela-icon-theme-git i3lock-fancy-git lightdm-webkit-theme-litarvan ttf-ms-fonts
}

aurgnome()
{
    yay --noconfirm -S brave-bin nerd-fonts-fira-code ttf-nerd-fonts-hack-complete-git pop-icon-theme-git python-ueberzug ranger-git ttf-ms-fonts
}

# Some pacakges are required by my emacs config like sbcl clang llvm cmake remove these if u dont use emacs 
# atool and avfs for ranger extracting files and highlight for syntax highlight in previews for ranger ffmpegthumnailer for vedios
bspwm()
{
    package="bspwm sxhkd nitrogen mate-power-manager xclip feh zsh  xorg-xprop xorg-xwininfo xdotool mpd mpv mpc ncmpcpp alacritty stow rofi sbcl zsh-syntax-highlighting"
    package="$package picom git network-manager-applet flatpak ttf-fira-code ttf-fira-sans ttf-font-awesome emacs xorg-xsetroot lxappearance-gtk3 zsh-completions"
    package="$package python-pywal dunst gtk-engines llvm clang cmake materia-gtk-theme noto-fonts-emoji noto-fonts xss-lock atool avfs dosbox zsh-autosuggestions"
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
    package="$package git dosbox xclip dconf kitty easytag atool avfs lollypop noto-fonts-emoji stow mpd mpc ncmpcpp noto-fonts sbcl clang llvm cmake zsh-autosuggestions"
    package="$package fzf python-pynvim flatpak seahorse-nautilus ttf-font-awesome neovim nvidia nvidia-prime ttf-fira-code ttf-fira-sans zsh-syntax-highlighting zsh-completions"
    sudo pacman --noconfirm -S $(echo $package)
}

if ! pacman -Q yay;
then
    git clone https://aur.archlinux.org/yay-bin.git ~/.aur
    cd ~/.aur
    makepkg -si
    sudo sed -i "s/#MAKEFLAGS=\"-j2\"/MAKEFLAGS=\"-j$(nproc)\"/" /etc/makepkg.conf
fi

echo " 1.Bspwm 2.Gnome "
echo " Enter the options "
read option
if [[ option=="2" ]]
then
    echo "installing gnome"
    aurgnome
    gnome
    cd ~/dotfiles
    echo "Creating symlinks"
    stow systemd emacs dconf systemd ranger mpv mpd ncmpcpp nvim zsh
    dconf load / < ~/.config/dconf/user.conf
    systemctl enable --user mpd.service
    systemctl enable --user emacs
    sudo systemctl enable gdm.service
elif [[ option="1" ]]
then
    echo "installing bspwm"
    aurbspwm
    bspwm
    cd ~/dotfiles
    echo "Creating symlinks"
    stow systemd emacs systemd ranger mpv mpd ncmpcpp nvim kitty polybar bspwm sxhkd rofi wal dunst picom zsh
    dconf load / < ~/.config/dconf/user.conf
    systemctl enable --user mpd.service
    systemctl enable --user emacs
    sudo systemctl enable lightdm.service
fi

echo "Removing the orphan packages"
sudo pacman --noconfirm -Rns $(pacman -Qqtd)

echo "Installing Bibata"
if [[ ! -d /usr/share/icons/Bibata_Amber ]]
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

if [[ ! -d ~/.powerlevel10k ]]
then
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
fi
