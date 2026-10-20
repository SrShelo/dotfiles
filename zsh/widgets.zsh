# User Defined Widget (udw)
# User Defined Function (udf)
# I use this prefixes to differentiate with other functions and
# widgets registered by plugins.

udf-buffer-prefix () {
    # This function works like udf-buffer-prepend, but it's much simpler.
    [ -z "$1" ] && text="${WIDGET#udw-buffer-prefix-*}" || text="$1"

    # Use the last command if the buffer is empty
    if [ -z "$BUFFER" ]; then
        BUFFER="$(fc -ln -1)"
        CURSOR="${#BUFFER}"
    fi

    if [[ "${LBUFFER:0:${#text}}" == $text ]]; then
        LBUFFER="${LBUFFER:${#text}}"
    else
        LBUFFER="$text$LBUFFER"
    fi

    zle redisplay
}

udf-buffer-prepend () {
    # Widgets made with this function works exactly, or very closely,
    # to fish_commandline_prepend function from fish.
    # This function can take the word to prepend from first argument
    # or by defining the widget like this:
    # zle -N 'udw-buffer-prepend-sudo '
    # so the text to be prepend would be 'sudo ' and it won't be
    # necessary to make a wrapper function.
    # NOTE: It's important to put the space.
    local word i char quote='' subshell_lvl=0
    if [ -n "$1" ]; then
        word="$1"
    else
        word="${WIDGET#udw-buffer-prepend-*}"
    fi
    [[ -z "$BUFFER" ]] && BUFFER="$(fc -ln -1)" && CURSOR="${#BUFFER}"

    # Filter everything between quotes and escaped characters
    # so we can easly check what character is &, |, ; or (
    # (due the loop is going backwards, is not relevant to know
    # if before a | there is another |)
    for (( i=$CURSOR; i >=1; i-- )); do
        char="${LBUFFER[$i]}"
        local cha="${LBUFFER[(($i - 1))]}"
        [[ $cha == '\' ]] && continue
        if [[ -z $quote && "$char" =~ "(\"|')" ]]; then
            quote="$char"
            continue
        elif [[ -n $quote && $char == $quote ]]; then
            quote=''
            continue
        fi
        [[ -n $quote ]] && continue

        if [[ "$char" == ")" ]]; then
            ((subshell_lvl++))
            continue
        elif [[ "$char" == "(" ]] && (( subshell_lvl >= 1 )); then
            ((subshell_lvl--))
            continue
        fi

        if [[ "$char" =~ "(;|\||&)" || ( "$char" == '(' && $subshell_lvl == 0 ) ]]; then
            [[ "${LBUFFER[(($i + 1))]}" == ' ' ]] && ((i++))
            break
        fi
    done

    if [[ "${BUFFER[(($i + 1)), (($i + ${#word}))]}" == "$word" ]]; then
        ((CURSOR-=${#word}))
        BUFFER="${BUFFER[1, $i]}${BUFFER[(($i + ${#word} + 1)), ${#BUFFER}]}"
    else
        LBUFFER="${LBUFFER[1,$i]}$word${LBUFFER[(($i + 1)),#LBUFFER]}"
    fi

    # Make highlight plugins work properly after updating the buffer.
    zle redisplay
}
udf-buffer-prepend-backslash () {
# └> Necessary wrapper function, due backslash caused issues registering
# a widget with it.
    udf-buffer-prepend '\'
}

udf-more-bindings () {
    # This reads 1 key at a time to trigger widgets and 
    local key
    read -sk1 key
    case $key in
        't')
            local key1
            read -sk1 key1
            case $key1 in
                's') zle autosuggest-toggle && zle redisplay ;;
            esac
            ;;
    esac
}

# ------------- WIDGETS -------------

zle -N udw-more-bindings udf-more-bindings

zle -N 'udw-buffer-prepend-man ' udf-buffer-prepend
zle -N 'udw-buffer-prepend-nohup ' udf-buffer-prepend
zle -N 'udw-buffer-prepend-please ' udf-buffer-prepend
zle -N udw-buffer-prepend-backslash udf-buffer-prepend-backslash
