#!/bin/sh

xrdb merge ~/.Xresources 

function run {
 if ! pgrep $1 ;
  then
    $@&
  fi
}

run "xrandr --output eDP-1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output HDMI-1 --off --output DP-1-0 --mode 1920x1080 --pos 1920x0 --rotate normal --output DP-1-1 --off"
run nm-applet
run blueman-applet
run xfce4-power-manager
run "/usr/lib/xfce4/notifyd/xfce4-notifyd"
run "/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1"
run "prime-run picom"
run "numlockx on"
run clipmenud
run volumeicon
sxhkd -c ~/.config/chadwm/sxhkd/sxhkdrc &
feh --bg-fill /home/lucifer/Pictures/walls/images/night_moon.webp
~/.config/chadwm/scripts/bar.sh &
while type chadwm >/dev/null; do chadwm && continue || break; done
