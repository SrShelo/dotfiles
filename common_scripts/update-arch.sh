#!/bin/fish

set BAD 'bad'
set NICE 'ok'

set PACMAN  $BAD
set YAY     $BAD
set SNAP    $BAD
set FLATPAK $BAD

sudo echo "pacman: " | lolcat --seed=-25
sudo pacman -Syyuu --noconfirm && set PACMAN $NICE
if command -s yay > /dev/null
    echo "yay: " | lolcat --seed=-15
    yay -Syyu --noconfirm && set YAY $NICE
end
if command -s snap > /dev/null
    echo "snap: " | lolcat --seed=8
    sudo snap refresh && set SNAP $NICE
end
if command -s flatpak > /dev/null
    echo "flatpak" | lolcat --seed=90
    flatpak update --noninteractive && set FLATPAK $NICE
end

echo ''
echo "Printing exit status:" | lolcat
echo "pacman: $PACMAN"
echo "yay: $YAY"
echo "snap: $SNAP"
echo "flatpak: $FLATPAK"
