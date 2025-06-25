#!/bin/bash
wallpaper_engine="swww"
# options: hyprpaper, wpaperd, swww, mpvpaper

function kill-all-engines() {
    pkill hyprpaper
    if [[ $1 != "swww" ]]; then
        pkill swww
    fi
    pkill mpvpaper
    if [[ $1 != "wpaperd" ]]; then
        pkill wpaperd
    fi
}

if [ "$wallpaper_engine" == "hyprpaper" ]; then
    echo ":: using hyprpaper"
    kill-all-engines
    hyprpaper
elif [ "$wallpaper_engine" == "wpaperd" ]; then
    echo ":: using wpaperd"
    kill-all-engines "swww"
    wpaperd -d
elif [ "$wallpaper_engine" == "swww" ]; then
    transition_type="none"
    # options: none, random
    echo ":: using swww"
    kill-all-engines "swww"
    swww-daemon -f xrgb 2> /dev/null &
    cd ~/Pictures/Wallpapers/
    swww img "$(ls | shuf -n 1)" --transition-type="$transition_type"
elif [ "$wallpaper_engine" == "mpvpaper" ]; then
    mode="playlist"
    echo "::using mpvpaper"
    kill-all-engines
    # > loop, playlist
    cd ~/Pictures/Video\ Wallpapers/
    if [ "$mode" == "loop" ]; then
        mpvpaper -o "no-audio --loop-file" '*' "$(ls | shuf -n 1)"
    elif [ "$mode" == "playlist" ]; then
        mpvpaper -o "no-audio --loop-playlist shuffle" '*' ./
    fi
fi
