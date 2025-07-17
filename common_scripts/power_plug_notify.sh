# !/usr/bin/env bash

# Script that notify when the battery is charging or discharging
# see: https://wiki.archlinux.org/title/Udev#Triggering_desktop_notifications_from_a_udev_rule

# export DISPLAY=:0
# export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus

BAT_CHARG=$1
BAT_LVL=$(acpi -b | grep -P -o "[0-9]+(?=%)")
NOTIF_ID=''

if [ $BAT_CHARG -eq 1 ]; then
    NOTIF_ID=$(notify-send "Charging" "${BAT_LVL}% of battery charged." -u low -i "/usr/share/icons/custom/battery-plus.png" -t 5000 -r 9991 -p -a battery-notification)
elif [ $BAT_CHARG -eq 0 ]; then    
    NOTIF_ID=$(notify-send "Discharging" "${BAT_LVL}% of battery remaining." -u low -i "/usr/share/icons/custom/battery-minus.png" -t 5000 -r 9991 -p -a battery-notification)
fi

~/.config/common_scripts/battery_notify.sh $NOTIF_ID
