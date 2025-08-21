# !/usr/bin/env bash

#  This is script opens a menu with windows opened listed, then
# focus the selected window.

# [[ SETUP ]]
dmenu_command='tofi --config='$HOME'/.config/tofi/wide_config --placeholder-text=Window --history=false --fuzzy-match=true'
# dmenu_command='wofi --dmenu'

# TODO: make this variable work
# sort_options: yes | reverse | any other value cancels sorting
# sort_options="reverse"

####

replace_some_appids() {
    sed 's/org.qutebrowser.qutebrowser/qutebrowser/g' |
        sed 's/com.mitchellh.ghostty/ghostty/g'
}

get_windows() {
    raw="$(niri msg windows)"
    mapfile -t ids < <(printf "%s" "$raw" |
        grep --no-group-separator "^Window ID " |
        awk '{print $3}' |
        sed -E 's/://g' )
    mapfile -t titles < <(printf "%s" "$raw" |
        grep --no-group-separator "^ *Title: " |
        sed 's/ *Title: *//g' |
        sed -E 's/^"|"$//g' )
    mapfile -t appids < <(printf "%s" "$raw" |
        grep --no-group-separator "^ *App ID: " |
        sed 's/ *App ID: *//g' |
        sed -E 's/^"|"$//g' |
        replace_some_appids )
}

option_format() {
    echo "${appids[$1]} ·⊱ ${titles[$1]} · ⊰${ids[$1]}⊱"
}

get_options() {
    options=$(option_format 0)
    for i in $(seq 1 $((${#ids[@]} - 1))); do
        options="$options
$(option_format i)"
    done

    # if [ $sort_options == 'yes' ]; then
    #     options=$(printf '%s' "$options" | sort)
    # elif [ $sort_options == 'reverse' ]; then
    #     options=$(printf '%s' "$options" | sort -r)
    # fi
}


get_windows
get_options

selection=$(( $(printf "%s" "$options" | grep -nxF "$(echo "$options" | $dmenu_command)" | cut -d: -f1) - 1 ))

if [ $selection -eq '-1' ]; then
    exit
fi

niri msg action focus-window --id ${ids[selection]}
