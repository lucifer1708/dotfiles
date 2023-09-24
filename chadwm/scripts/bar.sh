#!/bin/env sh

# INIT
printf "$$" > ~/.cache/pidofbar
sec=0

update_memory () { 
	memory="$(free -h | sed -n "2s/\([^ ]* *\)\{2\}\([^ ]*\).*/\2/p")"
}

update_time () { 
	time="$(date "+[  %a %d %b ] [  %I:%M %P ]")" 
}

temp_value=$(sensors | awk '/^edge/ {print $2 }' | tr -d +)

capcity(){
get_capacity="$(cat /sys/class/power_supply/BAT1/capacity)"
echo $get_capacity
}

update_bat () { 
	# you might need to change the path depending on your device
	read -r bat_status </sys/class/power_supply/BAT0/status
	read -r bat_capacity </sys/class/power_supply/BAT0/capacity
	if [ "$bat_status" = "Charging" ]; then
		bat_status=""
	elif [ "$bat_capacity" -gt 80 ]; then
		bat_status=""
	elif [ "$bat_capacity" -gt 60 ]; then
		bat_status=""
	elif [ "$bat_capacity" -gt 40 ]; then
		bat_status=""
	elif [ "$bat_capacity" -gt 20 ]; then
		bat_status=""
	else 
		bat_status=""
	fi
	bat="$bat_status $bat_capacity%"
}


display () { 
	xsetroot -name "[ 󰔐 $temp_value] [ 󰂄 $(capcity)%] [ 󰻠 $cpu_val] [  $memory ] $time"
}

# Handling receiving signal
# RTMIN = 34 (always)
trap	"update_vol;display"	"RTMIN"

## kill -m "$(cat ~/.cache/pidofbar)"
# where m = 34 + n

while true
do
	sleep 1 &
  wait && { 
		# to update item ever n seconds with a offset of m
		## [ $((sec % n)) -eq m ] && udpate_item
		[ $((sec % 5 )) -eq 0 ] && update_time
		[ $((sec % 15)) -eq 0 ] && update_memory

		[ $((sec % 5 )) -eq 0 ] && display
		sec=$((sec + 1))
	}
done 
