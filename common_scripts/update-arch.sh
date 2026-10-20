#!/bin/bash
PKG_MANAGERS=(pacman yay snap flatpak)

BAD='bad'
NICE='ok'

HELP_PAGE="\
A user definied script for updating the sistem with defined pkg managers.
Script file: $0
Usage:
    update
    update [OPTIONS]
    update [OPTIONS] [PKG_MANAGER1 [PKG_MANAGER2 ...]]

    -h, -?, --help          print this help page
    -l, --list              list all pkg managers available
    -c, --checkinternet     check internet connection before updating
    -C, --checkcommands     just check if all commands are installed
    -s, --silent            only print summary (errors won't be printed)
"

declare -a OPTIONS
# Format:'<OPTION_NAME>[;SHORT_NAME1[;SHORT_NAME2...]]'
OPTIONS[0]='help;h;?'
OPTIONS[1]='list;l'
OPTIONS[2]='checkinternet;c'
OPTIONS[3]='checkcommands;C'
OPTIONS[4]='silent;s'

# FUNCTIONS FOR PKG MANAGER:
func_pacman () {
    sudo printf "pacman:\n" | lolcat --seed=-25
    sudo pacman -Syyuu --noconfirm
}

func_yay () {
    printf "yay:\n" | lolcat --seed=-15
    yay -Syyuu --noconfirm
}

func_snap () {
    printf "snap:\n" | lolcat --seed=8
    sudo snap refresh
}

func_flatpak () {
    printf "flatpak:\n" | lolcat --seed=90
    flatpak update --noninteractive
}


# OPTION FUNCTIONS:
print_help () {
    printf "$HELP_PAGE"
}

list_pkg_managers () {
    for pkgman in "${PKG_MANAGERS[@]}"; do
        printf "$pkgman\n"
    done
}
check_internet () {
    printf 'Checking internet connection... '
    if ping -c2 archlinux.org > /dev/null ; then
        printf 'OK\n' | lolcat -S -10
    else
        printf 'BAD\n' | lolcat -S 80
        exit 1
    fi
}
check_commands () {
    error=0
    for command in "${PKG_MANAGERS[@]}"; do
        if [ ! $(command -v "$command") ]; then
            printf "\033[1;31mDetected invalid command: $command\n\033[0;0m"
            error=1
        fi
    done
    if [ $error == 0 ]; then
        printf "All commands in 'PKG_MANAGERS' array are installed.\n"
    fi
    exit $error
}

# THE REST OF THE CODE:
declare -a passed_options

get_options () {
    printf '%s\n' "${passed_options[@]}"
}

# This code allows to repeat options, but there is no problem with that.
set_options () {
    declare -a available_options
    for string in "${OPTIONS[@]}"; do
        IFS=';' read -a some_options <<< "${string[@]}" 
        available_options+=(${some_options[@]})
    done

    for arg in "$@"; do
        # One-dash arguments
        if [[ $(printf '%.1s' "$arg") == '-' && $(printf '%.2s' "$arg") != '--' ]]; then
            if [[ $(printf '%s\n' "${available_options[@]}" | grep "^${arg:1}\$") ]]; then
                # look for the option that was found in available_options
                for string in "${OPTIONS[@]}"; do
                    # "A;B;C" -> (A B C)
                    IFS=';' read -a some_options <<< "${string[@]}" 
                    if [ $(printf '%s\n' "${some_options[@]}" | grep "^${arg:1}\$") ]; then
                        passed_options+=(${some_options[0]})
                        break
                    fi
                done
            else
                printf '%s\n' "ERROR: $arg is not a valid argument."
                exit 1
            fi
        # Two-dash arguments
        elif [[ $(printf '%.2s' "$arg") == '--' ]]; then
            if [[ $(printf '%s\n' "${available_options[@]}" | grep "^${arg:2}\$") ]]; then
                for string in "${OPTIONS[@]}"; do
                    IFS=';' read -a some_options <<< "${string[@]}" 
                    if [ "${arg:2}" == "${some_options[0]}" ]; then
                        passed_options+=(${some_options[0]})
                        break
                    fi
                done
            else
                printf '%s\n' "ERROR: $arg is not a valid argument."
                exit 1
            fi
        fi
    done
}
set_options "$@"

before_update () {
    if [ $(get_options | grep '^help$') ]; then
        print_help
        exit 0
    fi
    if [ $(get_options | grep '^list$') ]; then
        list_pkg_managers
        exit 0
    fi
    if [ $(get_options | grep '^checkcommands$') ]; then
        check_commands
    fi
    if [ $(get_options | grep '^checkinternet$') ]; then
        check_internet
    fi
}

print_summary () {
    printf "System update status summary:\n" | lolcat
    summary=''
    for the_command in "${pkg_managers[@]}"
    do
        summary="$summary
$the_command: ${!the_command}"
    done
    summary=${summary:1}
    printf "$summary\n"
    # summary=$(echo $summary | sed 's/\\\n//')
    # string unescape $summary
    notify-send -t 10000 'System update status summary' "$summary" -u low
}

#############
before_update # this also check invalid options

declare -a pkg_managers
for arg in "$@"
do
    if [ $(printf '%.1s' "$arg") != '-' ]; then
        pkg_managers+=("$arg")
    fi
done
if [ ! "${pkg_managers[*]}" ]; then
    pkg_managers=("${PKG_MANAGERS[@]}")
fi

# check invalid pkg managers
for arg in "${pkg_managers[@]}"
do
    if [ $(printf '%s\n' "${PKG_MANAGERS[@]}" | grep "^$arg\$") ]; then
        if [ ! $(command -v $arg) ]; then
            printf "\033[1;31mERROR: '$arg' is not a valid command\n\033[0;0m"
            printf "Remember to register package managers writing their COMMANDS (without arguments) in the variable 'PKG_MANAGERS' in \033[4m$0\033[0;0m and install the package manager in question\n"
            exit 1
        fi
    else
        printf "\033[1;31mERROR: '$arg' is not registered as package manager in \033[4m$0\n\033[0;0m"
        exit 1
    fi
done

# Update
if [ ! $(get_options | grep '^silent$') ]; then
    sudo printf 'Starting to update the system...\n' | lolcat
    for pkgman in "${pkg_managers[@]}"
    do
        if [ $(command -v $pkgman) ]; then
            eval $pkgman=$BAD
            func_$pkgman && eval $pkgman=$NICE
        fi
    done
    printf '\n'
else
    sudo printf ''
    for pkgman in "${pkg_managers[@]}"
    do
        if [ $(command -v $pkgman) ]; then
            eval $pkgman=$BAD
            func_$pkgman > /dev/null 2> /dev/null && eval $pkgman=$NICE
        fi
    done
fi
print_summary

exit 0
