#!/usr/bin/env sh
sudo echo "pacman: " | lolcat --seed=-25
sudo pacman -Syyu --noconfirm
sudo echo "yay: " | lolcat --seed=-15
yay -Syyu --noconfirm
sudo echo "snap: " | lolcat --seed=8
sudo snap refresh
