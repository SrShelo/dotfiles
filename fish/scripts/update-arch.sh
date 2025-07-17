#!/bin/fish
sudo echo "pacman: " | lolcat --seed=-25
sudo pacman -Syyu --noconfirm
if command -s yay > /dev/null
    echo "yay: " | lolcat --seed=-15
    yay -Syyu --noconfirm
end
if command -s snap > /dev/null
    echo "snap: " | lolcat --seed=8
    sudo snap refresh
end
if command -s flatpak > /dev/null
    echo "flatpak" | lolcat --seed=90
    flatpak update --noninteractive
end
