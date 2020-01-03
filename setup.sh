#!/bin/sh

echo "Creating symlinks"
stow alacritty dunst lock ncmpcpp rofi bspwm sxhkd doom-emacs mpd mpv polybar ranger picom vim 

echo " install ueberzug for ranger image preview "

echo " mpd setup "

echo " default directory is ~/Music change in mpd.conf"

touch ~/.config/mpd/pid
touch ~/.config/mpd/log
touch ~/.config/mpd/playlist
touch ~/.config/mpd/state
touch ~/.config/mpd/databse


