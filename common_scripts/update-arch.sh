#!/bin/bash
PKG_MANAGERS=(pacman yay snap flatpak)

BAD='bad'
NICE='ok'

HELP_PAGE="\
A user definied script for updating the sistem with defined pkg managers.
Script file: $0
Usage:
    update
    update [OPTION]
    update [PKG_MANAGER [PKG_MANAGER ...]]

    -l, --list          list all pkg managers available
    -h, -?, --help      print this help page
"

func_pacman () {
    sudo echo "pacman:" | lolcat --seed=-25
    sudo pacman -Syyu --noconfirm
}

func_yay () {
    echo "yay:" | lolcat --seed=-15
    yay -Syyu --noconfirm
}

func_snap () {
    echo "snap:" | lolcat --seed=8
    sudo snap refresh
}

func_flatpak () {
    echo "flatpak:" | lolcat --seed=90
    flatpak update --noninteractive
}

check_internet () {
    echo -n 'Checking internet connection... '
    if ping -c2 archlinux.org > /dev/null ; then
        echo 'OK' | lolcat -S -10
    else
        echo 'BAD' | lolcat -S 80
        exit 1
    fi
}

print_summary () {
    echo "System update status summary:" | lolcat
    summary=''
    for the_command in "$@"
    do
        summary="$summary
$the_command: ${!the_command}"
    done
    summary=${summary:1}
    echo "$summary"
    # summary=$(echo $summary | sed 's/\\\n//')
    # string unescape $summary
    notify-send -t 10000 'System update status summary' "$summary" -u low
}

if [ ! "$1" ]; then
    # Case: update without specifying pkg managers
    check_internet
    sudo echo 'Starting to update the system... ' | lolcat
    for pkgman in "${PKG_MANAGERS[@]}"
    do
        if [ $(command -v $pkgman) ]; then
            eval $pkgman=$BAD
            func_$pkgman && eval $pkgman=$NICE
        fi
    done
    echo
    print_summary "${PKG_MANAGERS[@]}"
else
    # Check if the arguments are subcommands
    case "$1" in
        -l | --list)
            for pkgman in "${PKG_MANAGERS[@]}"
            do
                echo $pkgman
            done
            exit 0
            ;;
        -h | -? | --help)
            echo -n "$HELP_PAGE"
            exit 0
            ;;
    esac
    # If not, they must be pkg managers in the list
    # Check if the specified pkg managers are registered and
    # their commands are installed.
    for arg in "$@"
    do
        if echo "$@" | grep $arg > /dev/null; then
            if [ ! $(command -v $arg) ]; then
                echo -n ERROR: | lolcat
                echo "'$arg' is not a command installed" | lolcat
                echo "Remember to register package managers writing their COMMANDS (without arguments) in the variable 'PKG_MANAGERS' in $(status filename)"
                exit 1
            fi
        else
            echo -n 'ERROR: ' | lolcat
            echo "'$arg' is not registered as package manager in $(status filename)" | lolcat
            exit 1
        fi
    done
    check_internet
    echo 'Starting to update specified pkg managers...' | lolcat
    for arg in "$@"
    do
        eval $arg=$BAD
        func_$arg && eval $arg=$NICE
    done
    echo
    print_summary "$@"
fi
