#!/bin/fish

set PKG_MANAGERS pacman yay snap flatpak

set BAD 'bad'
set NICE 'ok'

set HELP_PAGE "
A user definied script for updating the sistem with defined pkg managers.
Script file: $(status filename)
Usage:
    update
    update [OPTION]
    update [PKG_MANAGER [PKG_MANAGER ...]]

    -l, --list          list all pkg managers available
    -h, -?, --help      print this help page
"

# PACKAGE MANAGER FUNCTIONS
function func_pacman
    sudo echo "pacman:" | lolcat --seed=-25
    sudo pacman -Syyu --noconfirm
end

function func_yay
    echo "yay:" | lolcat --seed=-15
    yay -Syyu --noconfirm
end

function func_snap
    echo "snap:" | lolcat --seed=8
    sudo snap refresh
end

function func_flatpak
    echo "flatpak:" | lolcat --seed=90
    flatpak update --noninteractive
end
###

function check_internet
    echo -n 'Checking internet connection... '
    if ping -c2 archlinux.org > /dev/null
        echo 'OK' | lolcat -S -10
    else
        echo 'BAD' | lolcat -S 80
        exit 1
    end
end

function print_summary
    echo "System update status summary:" | lolcat
    set summary ''
    for the_command in $argv
        set summary "$summary\n$the_command: $$the_command"
    end
    set summary $(echo $summary | sed 's/\\\n//')
    string unescape $summary
    notify-send -t 10000 'System update status summary' "$summary" -u low
end

if test -z $argv[1]
    # Case: update without specifying pkg managers
    check_internet
    sudo echo 'Starting to update the system... ' | lolcat
    for pkgman in $PKG_MANAGERS
        if command -s $pkgman > /dev/null
            set $pkgman $BAD
            func_$pkgman && set $pkgman $NICE
        end
    end
    echo
    print_summary $PKG_MANAGERS
else
    # Check if the arguments are subcommands
    switch $argv[1]
        case -l --list
            for pkgman in $PKG_MANAGERS
                echo $pkgman
            end
            exit 0
        case -h -? --help
            echo -n $HELP_PAGE
            exit 0
    end
    # If not, they must be pkg managers in the list
    # Check if the specified pkg managers are registered and
    # their commands are installed.
    for arg in $argv
        if contains $arg $PKG_MANAGERS
            if not command -s $arg > /dev/null
                echo -n ERROR: | lolcat
                echo "'$arg' is not a command installed" | lolcat
                echo "Remember to register package managers writing their COMMANDS (without arguments) in the variable 'PKG_MANAGERS' in $(status filename)"
                exit 1
            end
        else
            echo -n 'ERROR: ' | lolcat
            echo "'$arg' is not registered as package manager in $(status filename)" | lolcat
            exit 1
        end
    end
    check_internet
    echo 'Starting to update specified pkg managers...' | lolcat
    for a_command in $argv
        set $a_command $BAD
        func_$a_command && set $a_command $NICE
    end
    # Update specified pkg managers
    echo
    print_summary $argv
end

