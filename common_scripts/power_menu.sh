# !/usr/bin/env bash

# TODO: Make a fallback for an unrecognized option

# Execute the command with one of the options or select one interactively
option=$([[ $1 != "" ]] && echo $1 || echo "\
Suspend
Hybrid Sleep
Hibernate
Lock Screen
Close Session
Soft Reboot
Reboot
Shut Down" | tofi)

if [[ $MY_SCREEN_LOCKER == '' ]]; then
    echo "WARNING: Assuming wayland server and hyprlock it's installed."
    MY_SCREEN_LOCKER=hyprlock
fi


if [[ $option == "Suspend" ]]; then
	$MY_SCREEN_LOCKER & sleep 0.5 && systemctl suspend
elif [[ $option == "Hybrid Sleep" ]]; then
	$MY_SCREEN_LOCKER & sleep 0.5 && systemctl hybrid-sleep && hyprlock
elif [[ $option == "Hibernate" ]]; then
	$MY_SCREEN_LOCKER & sleep 0.5 && systemctl hibernate && hyprlock
elif [[ $option == "Lock Screen" ]]; then
	$MY_SCREEN_LOCKER
elif [[ $option == "Close Session" ]]; then
    case $XDG_CURRENT_DESKTOP in
        niri)
            niri msg action quit -s
            ;;
        Hyprland)
            hyprctl dispatch exit
            ;;
        *)
            # let's see if one of theses closes
            killall wayfire ||
            notify-send "Command to close this desktop not set" "Please set it in $(pwd)/power_menu.sh"
            ;;
    esac
elif [[ $option == "Soft Reboot" ]]; then
	systemctl soft-reboot
elif [[ $option == "Reboot" ]]; then
	reboot
elif [[ $option == "Shut Down" ]]; then
	shutdown now
fi
