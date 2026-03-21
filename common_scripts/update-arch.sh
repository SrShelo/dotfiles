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
    sudo echo "pacman: " | lolcat --seed=-25
    sudo pacman -Syyu --noconfirm && set pacman $NICE
end

function func_yay
    echo "yay: " | lolcat --seed=-15
    yay -Syyu --noconfirm && set yay $NICE
end

function func_snap
    echo "snap: " | lolcat --seed=8
    sudo snap refresh && set snap $NICE
end

function func_flatpak
    echo "flatpak" | lolcat --seed=90
    flatpak update --noninteractive && set flatpak $NICE
end
###

function print_summary
    echo ''
    echo "Exit status summary:" | lolcat
    for the_command in $argv
        echo "$the_command: $$the_command"
    end
end

if test -z $argv[1]
    sudo echo 'Starting to update the system... ' | lolcat
    for pkgman in $PKG_MANAGERS
        if command -s $pkgman > /dev/null
            set $pkgman $BAD
            func_$pkgman
        end
    end
    print_summary $PKG_MANAGERS
else
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
    # Check if the specifies pkg managers are registered and
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
    echo 'Starting to update specified pkg managers...' | lolcat
    for a_command in $argv
        set $a_command $BAD
        func_$a_command
    end
    # Update specified pkg managers
    print_summary $argv
end

