#!/bin/dash
interval=0

cpu() {
  cpu_val=$(~/.local/bin/cpu-go)
  printf "$cpu_val"
}

bluetooth(){
     val=$(bluetoothctl devices | cut -f2 -d' ' | while read uuid; do bluetoothctl info $uuid; done|grep -e "|Connected\|Name"|cut -f2 -d":")
     printf "$val"
}

temp() {
  temp_value=$(sensors | awk '/^edge/ {print $2 }' | tr -d +)
  printf "$temp_value"
}

battery() {
  get_capacity="$(cat /sys/class/power_supply/BAT0/capacity)"
  printf "$get_capacity"
}

brightness() {
  printf "$(brightnessctl -m | cut -d, -f4 | tr -d %)"
}

mem() {
     usage=$(free --si | awk '/^Mem/ {printf("%0.2f",$3/1048576)}')
     total=$(free --si | awk '/^Mem/ {printf("%0.2f",$2/1048576)}')
     printf "$usage/$total Gib"
}

swap() {
     usage=$(free --si | awk '/^Swap/ {printf("%0.2f",$3/1048576)}')
     total=$(free --si | awk '/^Swap/ {printf("%0.2f",$2/1048576)}')
     printf "$usage/$total Gib"
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
  sleep 2 && xsetroot -name "[ 󰔐 $(temp)] [ 󰂄 $(battery)%] [ 󰻠 $(cpu)%] [ SWAP $(swap)] [  $(mem)] $(clock)"
done
