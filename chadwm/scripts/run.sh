#!/bin/dash

xrdb merge ~/.Xresources &
/home/lucifer/.screenlayout/scree.sh
nm-applet &
xfce4-power-manager &
/usr/lib/xfce4/notifyd/xfce4-notifyd & 
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
picom & 
numlockx on &
clipmenud &
volumeicon &
sxhkd -c ~/.config/chadwm/sxhkd/sxhkdrc &
~/.config/chadwm/scripts/bar.sh &
while type chadwm >/dev/null; do chadwm && continue || break; done
