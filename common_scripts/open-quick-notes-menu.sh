#!/bin/bash

# This script is intended to be executed with a keyboard bind.
# This code is made with the purpose of handel quick-notes
# with a simple menu.
# It is allowed to create new note files if the name doesn't
# match in the list.

# Adjust these variables
USE_ALT_VARS='yes' # instead of env vars
ALT_EDITOR='nvim'
ALT_TERM='kitty -e --app-id=quick-notes'
# change title or app-id to make window rules in your
# desktop environment or compositor.

USE_NEW='no' # create new files writing new or not

QUICK_NOTES_PATH="$HOME/Desktop/notas/quick-notes/"

DMENU_COMMAND=(fuzzel -d --mesg=Notes --placeholder="file name" --prompt=" ")
# DMENU_COMMAND="wofi --dmenu -H50%"

dmenu_command () {
    text=(fuzzel -d --mesg=Notes --placeholder=\"$1\" --prompt=\" \")
    echo "${text[@]}"
}


if [ ! -d $QUICK_NOTES_PATH ]; then
    mkdir -p $QUICK_NOTES_PATH
    echo "Directory created: $QUICK_NOTES_PATH"
fi

if [ $USE_ALT_VARS = 'yes' ]; then
    EDITOR=$ALT_EDITOR
    TERMINAL=$ALT_TERM
else
    if [ ! $EDITOR ]; then
        echo 'Environment variable $EDITOR does not exist.'
        echo 'Setting temporally $EDITOR to default "nvim".'
        EDITOR=$ALT_EDITOR
    fi
    if [ ! $TERMINAL ]; then
        echo 'Environment variable $TERMINAL does not exist.'
        echo 'Setting temporally $TERMINAL to default "kitty -e".'
        TERMINAL=$ALT_TERM
    fi
fi

note_list=$(ls $QUICK_NOTES_PATH)

selection=$(echo "$note_list" | eval $(dmenu_command 'file name'))

open_note () {
    $TERMINAL $EDITOR "$QUICK_NOTES_PATH/$1"
}

if [ $USE_NEW == 'yes' ]; then
    if [[ "$selection" != "new" && "$selection" ]]; then
        if echo "$note_list" | grep -Fx "$selection" > /dev/null ; then
            echo $TERMINAL
            echo '+======================+'
            open_note $selection
        fi
    elif [ "$selection" ]; then
        echo cómo llegué aquí
        selection2=$(eval $(dmenu_command 'name for new file'))
        selection3=$(echo -e "no\nyes" | eval $(dmenu_command "sure u wanna create $selection2?"))
        if [ "$selection3" = 'yes' ]; then
            echo "Creating new note \"$selection\"..."
            touch "$QUICK_NOTES_PATH/$selection2"
            open_note $selection2
        fi
    fi
else
    if echo "$note_list" | grep -Fx "$selection" > /dev/null ; then
        echo $TERMINAL
        echo '+======================+'
        open_note
    elif [ "$selection" ]; then
        echo cómo llegué aquí
        selection2=$(echo -e "no\nyes" | eval $(dmenu_command 'do u wanna create this file?'))
        if [ "$selection2" = 'yes' ]; then
            echo "Creating new note \"$selection\"..."
            touch "$QUICK_NOTES_PATH/$selection"
            open_note $selection
        fi
    fi
fi
