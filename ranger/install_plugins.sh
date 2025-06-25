#!/bin/bash
echo "Installing Ranger plugins..." | lolcat

echo "1: Ranger Devicons" | lolcat
git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons
echo "2: Ranger Archives" | lolcat
git clone https://github.com/maximtrp/ranger-archives.git ~/.config/ranger/plugins/ranger-archives
echo "3: Pygmentize" | lolcat
sudo pacman -S python-pygments

echo Done | lolcat