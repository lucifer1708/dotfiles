
#!/bin/dash

# ^c$var^ = fg color
# ^b$var^ = bg color

interval=0

# load colors
. ~/.config/chadwm/scripts/bar_themes/dracula


cpu() {
  cpu_val=$(~/.local/bin/cpu-go)
  printf "$cpu_val"
}

temp() {
  temp_value=$(sensors | awk '/^edge/ {print $2 }' | tr -d +)
  printf "$temp_value"
}

battery() {
  get_capacity="$(cat /sys/class/power_supply/BAT1/capacity)"
  printf "$get_capacity"
}

brightness() {
  printf "$(brightnessctl -m | cut -d, -f4 | tr -d %)"
}

mem() {
     usage="$(cat /proc/meminfo |sed -n 7p|awk '{printf("%.2f", $2/1000000)}')"
     total="$(cat /proc/meminfo |sed -n 1p|awk '{printf("%.2f", $2/1000000)}')"
     printf "$usage/$total GB"
}

wlan() {
	case "$(cat /sys/class/net/wl*/operstate 2>/dev/null)" in
	up) printf "Connected" ;;
	down) printf "Disconnected" ;;
	esac
}

clock() {
	time="$(date "+[  %a %d %b ] [  %I:%M %P ]")" 
     printf "$time"
}
while true; do
  [ $interval = 0 ] || [ $(($interval % 3600)) = 0 ] 
  interval=$((interval + 1))
  sleep 2 && xsetroot -name "[ 󰔐 $(temp)] [ 󰂄 $(battery)%] [ 󰻠 $(cpu)%] [  $(mem)] $(clock)"
done
