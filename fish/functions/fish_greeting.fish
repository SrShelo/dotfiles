# Defined in /usr/share/fish/functions/fish_greeting.fish @ line 1
function fish_greeting
    if not set -q fish_greeting
        set messages "¿Tai seguro watón?"
        set short_messages "BASINGA!" "¡Chuchetumare!"

        set imgs "\
      ▄▄ ▄███▄
    ▄▀▀▀▀░▄▄▄░▀▀▀▀▄
    █▒▒▒▒█░░░█▒▒▒▒█
    █▒▒▒▒▀▄▄▄▀▒▒▒▒█
    ▀▄▄▄▄▄▄▄▄▄▄▄▄▄▀ " "\
     █▀▀▀▀▀▀▀▀▀▀▀▀▀▀█
   ██▀▀▀██▀▀▀▀▀▀██▀▀▀██
   █▒▒▒▒▒█▒▀▀▀▀▒█▒▒▒▒▒█
   █▒▒▒▒▒█▒████▒█▒▒▒▒▒█
   ██▄▄▄██▄▄▄▄▄▄██▄▄▄██ " "\
  ▐▓█▀▀▀▀▀▀▀▀▀█▓▌ ▄▄▄▄▄
  ▐▓█  ▀   ▀  █▓▌ █▄▄▄█
  ▐▓█  ▀▄▄▄▀  █▓▌ █▄▄▄█
  ▐▓█▄▄▄▄▄▄▄▄▄█▓▌ █████
      ▄▄███▄▄     █████ " "\
        ▀▀▌       ▐▀▀
        ▄▀░░░░░░░░░▀▄
       ▐░░░░▄▀██▄█░░░▌
       ▐░░░▀████▀▄░░░▌
        ▀▄▄▄▄▄▄▄▄▄▄▄▀ " "\
   ░░▄▀▀▀▄░▄▄░░░░░░╠▓░░░░
   ░░░▄▀▀▄█▄░▀▄░░░▓╬▓▓▓░░
   ░░▀░░░░█░▀▄░░░▓▓╬▓▓▓▓░
   ░░░░░░▐▌░░░░▀▀███████▀
   ▒▒▄██████▄▒▒▒▒▒▒▒▒▒▒▒▒" "\
     ▄▄▄
   ▄▀░▄░▀▄
   █░█▄▀░█
   █░▀▄▄▀█▄█▄▀
  ▄▄█▄▄▄▄███▀ " "\
                  ▄▄   ▐█
      ▄▄▄   ▄██▄  █▀   █ ▄
    ▄██▀█▌ ██▄▄  ▐█▀▄ ▐█▀
   ▐█▀▀▌   ▄▀▌ ▌ █ ▌  ▌ ▌
   ▌▀▄ ▐  ▀▄ ▐▄ ▐▄▐▄ ▐▄ ▐▄ " "\
        ▄▄▄▄
       ▀▀▄██►
       ▀▀███►
        ▀███► █►
        ▄████▀▀ " "\
        ▄▀▄     ▄▀▄
       ▄█░░▀▀▀▀▀░░█▄
   ▄▄  █░░░░░░░░░░░█  ▄▄
  █▄▄█ █░░▀░░┬░░▀░░█ █▄▄█" "\
   ▄▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▄
  █░░░█░░░░░░░░░░▄▄░██░█
  █░▀▀█▀▀░▄▀░▄▀░░▀▀░▄▄░█
  █░░░▀░░░▄▄▄▄▄░░██░▀▀░█
   ▀▄▄▄▄▄▀     ▀▄▄▄▄▄▄▀
" "\
   ║░█░█░║░█░█░█░║
   ║░█░█░║░█░█░█░║
   ║░║░║░║░║░║░║░║
   ╚═╩═╩═╩═╩═╩═╩═╝" "\
  █▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀█
  █░░╦ ╦╔╗╦ ╔╗╔╗╔╦╗╔╗░░█
  █░░║║║╠ ║ ║ ║║║║║╠ ░░█
  █░░╚╩╝╚╝╚╝╚╝╚╝╩ ╩╚╝░░█
  █▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄█" "\
   O                O
   █▓██▄            █
   █▓▓░▀▄▀░░░░░░░░░░█
   █▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀█
   █                █ " "\
          ▓▓╬▓
         ▓▓▓║▓▓
        ▓▓▓▓╬▓▓▓▓
     ▄ ▓▓▓▓▓║▓▓▓▓▓
    ▀████████████████▀
  ░░░░░░░░░░░░░░░░░░░░░░ " "\
    ▄▀
  █▀▀▀█▀█
   ▀▄░▄▀
     █
   ▄▄█▄▄" "\
    ▒▒▒▒▒▒▒▒   ▒▒▒▒▒▒▒▒
   ▒▐▒▐▒▒▒▒▌▒ ▒▒▌▒▒▐▒▒▌▒
    ▒▀▄█▒▄▀▒   ▒▀▄▒▌▄▀▒
       ██         ██
░░░░░▄▄██▄░░░░░░░▄██▄░░░" "\
             ███
             ███
      ▄█████▄█▀▀
       ▀█████
        ▄████▄ " "\
      ▄█▀ ▄▄▄▄▄▄▄ ▀█▄
      ▀█████████████▀
          █▄███▄█
           █████
           █▀█▀█ " "\
            ▄▀ ▄▀
             ▀  ▀
           █▀▀▀▀▀█▄
           █░░░░░█─█
           ▀▄▄▄▄▄▀▀ " "\
    ▄▄██████▄▄
  ▄██▀▄█▄▄█▄▀██▄
  ▀▀▀▄██▀▀██▄▀▀▀
   ▄███ ██ ███▄
   █████▄▄█████ " "\
           ▄▄
          █░█
         ▄▀░█
  ████▄▄▄▀░░▀▀▀▀▄
  ████░░░░░░░░░░█
  ████░░░░░░░░░░█
  ████▄▄▄░░░░░░░█
  ▀▀▀▀   ▀▀▀▀▀▀▀ " "\
               ▄   ▄
               █▀█▀█
               █▄█▄█
                ███  ▄▄
                ████▐█ █
                ████   █
                ▀▀▀▀▀▀▀ " "\
        ▄   ▄
    ▄█▄ █▀█▀█ ▄█▄
   ▀▀████▄█▄████▀▀
        ▀█▀█▀
" "\
     ▒▒▒▒▒▒   ▄████▄
    ▒ ▄▒ ▄▒  ███▄█▀
    ▒▒▒▒▒▒▒ ▐████  █ █
    ▒▒▒▒▒▒▒  █████▄
    ▒ ▒ ▒ ▒   ▀████▀ " "\
   ▀        ▄▄  ▄███▄
  ▄▀▀▀▄   ▄█████████▀
  █   █  ▄██████  █▀
  █   █ ▀██████████▄
  ▀▄  ▀▀▀▀▀▀▀▀█▀▀██▀
   █ ▀▄▄   ▄▄▀   ██
   █▄▄▄▄▄▄▄█    ██▄▄"
        set big_imgs "\
          ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
        ▄▀            ▄       ▀▄
        █  ▄    ▄              █
        █            ▄█▄▄  ▄   █ ▄▄▄
 ▄▄▄▄▄  █      ▀    ▀█  ▀▄     █▀▀ ██
 ██▄▀██▄█   ▄       ██    ▀▀▀▀▀    ██
  ▀██▄▀██        ▀ ██▀             ▀██
    ▀████ ▀    ▄   ██   ▄█    ▄ ▄█  ██
       ▀█    ▄     ██    ▄   ▄  ▄   ██
       ▄█▄           ▀▄  ▀▀▀▀▀▀▀▀  ▄▀
      █▀▀█████████▀▀▀▀████████████▀
      ████▀  ███▀      ▀███  ▀██▀ " "\
▒▒▒▒▒▒▒▓
▒▒▒▒▒▒▒▓▓▓
▒▓▓▓▓▓▓░░░▓
▒▓░░░░▓░░░░▓
▓░░░░░░▓░▓░▓
▓░░░░░░▓░░░▓
▓░░▓░░░▓▓▓▓
▒▓░░░░▓▒▒▒▒▓
▒▒▓▓▓▓▒▒▒▒▒▓
▒▒▒▒▒▒▒▒▓▓▓▓
▒▒▒▒▒▓▓▓▒▒▒▒▓
▒▒▒▒▓▒▒▒▒▒▒▒▒▓
▒▒▒▓▒▒▒▒▒▒▒▒▒▓
▒▒▓▒▒▒▒▒▒▒▒▒▒▒▓
▒▓▒▓▒▒▒▒▒▒▒▒▒▓
▒▓▒▓▓▓▓▓▓▓▓▓▓
▒▓▒▒▒▒▒▒▒▓
▒▒▓▒▒▒▒▒▓ "
# set style (random 1 4)
set type (random 1 7) # Img or message
set style (random 1 3)
switch $type
    case 1
        set txt $imgs[(random 1 (count $imgs))]
    case 2
        set txt $big_imgs[(random 1 (count $big_imgs))]
    case 3
        set txt $messages[(random 1 (count $messages))]
    case 4
        fastfetch
    case 5
        toilet -f mono12 --gay $short_messages[(random 1 (count $short_messages))]
    case 6
            set txt
            for i in $(cowsay $messages[(random 1 (count $messages))])
                if test -z $txt
                    set txt "$i"
                    continue
                end
                set txt "$txt"\n"$i"
            end
            # set txt $txt[5]
    case 7
            set txt
            for i in $(cowsay $short_messages[(random 1 (count $short_messages))])
                if test -z $txt
                    set txt "$i"
                    continue
                end
                set txt "$txt"\n"$i"
            end
    # case 5
    #     countryfetch
    # case 4
    #     pokeget -random 1,2,3
    # case 5
    #     echo "  Shiny" | lolcat
    #     pokeget -random 1,2,3 -small -shiny
    # case 6
    #     echo "  Shiny" | lolcat
    #     pokeget -random 1,2,3 -shiny
    # case 7
    #     pokeget -random 1,2,3,4,5,6 -small
        end
        if [ ( count $type ) -lt 4 ]
          switch $style
            case 1
                echo $txt | lolcat
            case 2
                echo $txt | lolcat
            case 3
                echo $txt | lolcat
            case 4
                echo $txt
          end
        end
    end

  if set -q fish_private_mode
        set -l line (_ "fish is running in private mode, history will not be persisted.")
        if set -q fish_greeting[1]
            set -g fish_greeting $fish_greeting\n$line
        else
            set -g fish_greeting $line
        end
    end

  # The greeting used to be skipped when fish_greeting was empty (not just undefined)
  # Keep it that way to not print superfluous newlines on old configuration
  test -n "$fish_greeting"
    and echo $fish_greeting
end
