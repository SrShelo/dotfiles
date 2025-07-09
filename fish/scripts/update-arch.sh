#!/bin/fish
sudo echo "pacman: " | lolcat --seed=-25
sudo pacman -Syyu --noconfirm
sudo echo "yay: " | lolcat --seed=-15
yay -Syyu --noconfirm
command -s snap > /dev/null && sudo echo "snap: " | lolcat --seed=8 && sudo snap refresh
command -s flatpak > /dev/null && sudo echo "flatpack" | lolcat --seed=90 && flatpak update --noninteractive
