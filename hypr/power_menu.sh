#!/bin/bash
option=$(echo "\
Suspend
Hybrid Sleep
Hibernate
Lock Screen
Close Session
Soft Reboot
Reboot
Shut Down" | tofi)

if [[ $option == "Suspend" ]]; then
	systemctl suspend && hyprlock
elif [[ $option == "Hybrid Sleep" ]]; then
	systemctl hybrid-sleep
elif [[ $option == "Hibernate" ]]; then
	systemctl hibernate && hyprlock
elif [[ $option == "Lock Screen" ]]; then
	hyprlock
elif [[ $option == "Close Session" ]]; then
	hyprctl dispatch exit
elif [[ $option == "Soft Reboot" ]]; then
	systemctl soft-reboot
elif [[ $option == "Reboot" ]]; then
	reboot
elif [[ $option == "Shut Down" ]]; then
	shutdown now
fi
