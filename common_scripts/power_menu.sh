#!/usr/bin/env bash

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

if [[ $option == "Suspend" ]]; then
	systemctl suspend && hyprlock
elif [[ $option == "Hybrid Sleep" ]]; then
	systemctl hybrid-sleep && hyprlock
elif [[ $option == "Hibernate" ]]; then
	systemctl hibernate && hyprlock
elif [[ $option == "Lock Screen" ]]; then
	hyprlock
elif [[ $option == "Close Session" ]]; then
	hyprctl dispatch exit || niri msg action quit -s || killall wayfire
elif [[ $option == "Soft Reboot" ]]; then
	systemctl soft-reboot
elif [[ $option == "Reboot" ]]; then
	reboot
elif [[ $option == "Shut Down" ]]; then
	shutdown now
fi
