#!/bin/sh

xrdb merge ~/.Xresources 

function run {
 if ! pgrep $1 ;
  then
    $@&
  fi
}

run "/home/lucifer/.screenlayout/screen.sh"
run nm-applet
run blueman-applet
run xfce4-power-manager
run "/usr/lib/xfce4/notifyd/xfce4-notifyd"
run "/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1"
run "picom"
run "numlockx on"
run clipmenud
run volumeicon
sxhkd -c ~/.config/chadwm/sxhkd/sxhkdrc &
feh --bg-fill /home/lucifer/Pictures/walls/images/evening_girl.webp
~/.config/chadwm/scripts/bar.sh &
while type chadwm >/dev/null; do chadwm && continue || break; done
