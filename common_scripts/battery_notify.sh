# !/usr/bin/env bash

# This two make possile to send notifications by cronie running this script
export DISPLAY=:0
export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus

# Choose the level in which script should warn you
WARNING_LVL=20
BAT_DSCHARG=$(acpi -b | grep -c "Discharging")
BAT_LVL=$(acpi -b | grep -P -o "[0-9]+(?=%)")

# Prevent multiple notifications
FILE_FULL=/tmp/batteryfull
FILE_EMPTY=/tmp/batteryempty
NOTIF_ID=$1

if [[ $1 == '' ]]; then
    NOTIF_ID=9991
fi

# Reset notifications if status changed
if [ $BAT_DSCHARG -eq 1 ] && [ -f $FILE_FULL ]; then
    rm $FILE_FULL
elif [ $BAT_DSCHARG -eq 0 ] && [ -f $FILE_EMPTY ]; then
    rm $FILE_EMPTY
fi

# Make the notification if it haven't done it before and make a file to remember that
if [ ! -f $FILE_FULL ] && [ $BAT_LVL -gt 95 ] && [ $BAT_DSCHARG -eq 0 ]; then
    notify-send "Full battery" "$BAT_LVL% of charge." -i "/usr/share/icons/custom/battery-charging.png" -r $NOTIF_ID -a battery-notification
    touch $FILE_FULL
elif [ ! -f $EMPTY_FILE ] && [ $BAT_LVL -le $WARNING_LVL ] && [ $BAT_DSCHARG -eq 1 ]; then
    notify-send "Low Battery" "Battery is almost empty!" -u critical -i "/usr/share/icons/custom/battery-alert.png" -r $NOTIF_ID -a battery-notification
    touch $FILE_EMPTY
fi
