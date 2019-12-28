#!/bin/sh
$HOME/.config/polybar/launch.sh &
compton --backend glx &
nm-applet &
xsetroot -cursor_name left_ptr &
xss-lock -- i3lock &
xfce4-power-manager --daemon &
xfsettingsd --daemon &
nitrogen --restore &
sxhkd &

# switch caps and esc key
setxkbmap -option "caps:swapescape" &

# MPD daemon start (if no other user instance exists)
[ ! -s ~/.config/mpd/pid ] && mpd &
