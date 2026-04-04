# !/usr/bin/env bash

# NOTE: For now, this script only select a random wallpaper.

# NOTE: Remember to edit variables below to configure the script
# to your liking.

# NOTE: Maybe we could find nice textures to use as wallpapers here:
# https://texturelabs.org/

# Change the path where we are going to search in:
WALLPAPERS_PATH=~/Pictures/Wallpapers/

# wallapaper engine options:
# awww, mpvpaper, hyprpaper, wpaperd
WALLPAPER_ENGINE="awww"

FILE_LAST_ENGINE='/tmp/last_wallpaper_engine_used'
last_engine=$(cat $FILE_LAST_ENGINE)

# First we kill the running wallpaper engine
# if it's changed.
if [[ $WALLPAPER_ENGINE != $last_engine ]]; then
    echo ':: killing wallpaper engines before to start'
    pkill hyprpaper
    pkill mpvpaper
    pkill wpaperd
    awww kill
fi

# NOTE: Select which type of wallpaper you want to allow:
# WARN: Not all engines support video or animated gifs.
IMAGES_ALLOWED=true
GIFS_ALLOWED=true
VIDEOS_ALLOWED=false

# Specific engine config:
####
## awww
# options: none, random
AWWW_TRANSITION_TYPE='none'

## mpvpaper
# options: loop, playlist
# NOTE: in playlist mode, only the video directory will be used.
MPV_MODE='loop'
MPV_AUDIO=false
####

# NOTE: Comment and uncoment to select which subdirectory
# you want to search in:
WHERE_TO_SEARCH=(
    '/'
    '/pixel_art/'
    # '/fractals/'
    '/textures/'
    )
# This will search those uncommented directories within each allowed wallpaper type directory.

# NOTE: With this configuration the wallpapers directory's
# structure should be something like this:
# |-- gifs
# |   |-- pixel_art
# |
# |-- images
# |   |-- pixel_art
# |   |-- textures
# |
# |-- videos

# NOTE: Those directories should only contain files that can be treated as wallpaper.


###### CODE:

cd $WALLPAPERS_PATH

all_paths=()
if [ $IMAGES_ALLOWED ]; then
    for i in ${WHERE_TO_SEARCH[@]}; do
        all_paths=(${all_paths[@]} "./images$i")
    done
fi
if [ $GIFS_ALLOWED ]; then
    for i in ${WHERE_TO_SEARCH[@]}; do
        all_paths=(${all_paths[@]} "./gifs$i")
    done
fi
if [ $VIDEOS_ALLOWED ]; then
    for i in ${WHERE_TO_SEARCH[@]}; do
        all_paths=(${all_paths[@]} "./videos$i")
    done
fi
echo ":: This are all the paths to search: ${all_paths[@]}"
RANDOM_FILE=$(find ${all_paths[@]} -maxdepth 1 -type f | shuf -n 1)

echo ":: The random file is: $RANDOM_FILE"

command_aditions=''
if [ "$WALLPAPER_ENGINE" == "hyprpaper" ]; then
    echo ":: using hyprpaper"
    hyprpaper
elif [ "$wallpaper_engine" == "wpaperd" ]; then
    echo ":: using wpaperd"
    wpaperd -d
elif [ "$WALLPAPER_ENGINE" == "awww" ]; then
    echo ":: using awww"
    awww-daemon -f xrgb 2> /dev/null &
    awww img "$RANDOM_FILE" --transition-type="$AWWW_TRANSITION_TYPE"
elif [ "$WALLPAPER_ENGINE" == "mpvpaper" ]; then
    echo "::using mpvpaper"
    if [ ! $MPV_AUDIO ]; then
        command_aditions='no-audio'
    fi
    pkill mpvpaper
    if [ "$MPV_MODE" == "loop" ]; then
        mpvpaper -o "--loop-file $command_aditions" '*' "$RANDOM_FILE"
    elif [ "$MPV_MODE" == "playlist" ]; then
        mpvpaper -o "--loop-playlist shuffle $command_aditions" '*' ./videos/
    fi
fi

echo $WALLPAPER_ENGINE 1> $FILE_LAST_ENGINE
