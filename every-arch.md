# Every Arch
# To quickly connect to internet use `iwctl`
## Drivers and functionalities
### Fonts
- `sudo pacman -S noto-fonts` - To fix fonts problems
- `sudo pacman -S noto-fonts-cjk` - Other languages fonts, but I don't recommend because the Nerd Fonts
- `yay -S ttf-twemoji` - Emojis support

### Others
- `sudo pacman -S wget` - Web downloads
- `sudo pacman -S ntfs-3g` - To read NTFS file system
- `sudo pacman -S pulseaudio` - Audio

### "missing firmware for module: ..."
- `sudo pacman -S linux-firmware-qlogic` - Fix most problems

If modules for aic94xx, wd719x or xhci_pci are still missing execute:
- `yay -S aic94xx-firmware`
- `yay -S wd719x-firmware`
- `yay -S upd72020x-fw`

Respectively

## Tools
- `sudo pacman -S cronie` - See: https://wiki.archlinux.org/title/Cron
### Sound
- `sudo pacman -S pavucontrol` - Mixer
### File manager
- `sudo pacman -S ranger` - A terminal file manager
- `sudo pacman -S yazi` - Terminal file manager (The best I think)
- `sudo pacman -S ueberzug` - Ranger images previews support at most terminals
- `sudo pacman -S poppler` - Ranger PDFs previews support
### Screen
`sudo pacman -S arandr` - Generates a command for your own screens configurations
- `sudo pacman -S redshift libnotify notification-daemon cbatticon network-manager-applet` - For blue light suppression
- `sudo pacman -S vlc` - Media player

## Personalization
`curl -sS https://starship.rs/install.sh | sh` - One very custom prompt for any shell
- `sudo pacman -S fish`
- `sudo chsh -s /usr/local/bin/fish` - Makes fish as default shell
- `sudo pacman -S ghostty`
- `sudo pacman -S kitty` - GPU based term
- Install kitty-cat and change the default themes folder from /bin/kitty-cat and put "~/.config/kitty/themes"
```bash
mkdir -p ~/installing || cd ~/installing
git clone https://github.com/adi1090x/kitty-cat.git || bash ./kitty-cat/install
```

- interesting commands:
    - ncdu: manage disk space and see what's using more
    - asciinema: record terminal and replay it inside terminal
    - pyradio: terminal app to play radios from a configured playlist with their urls
    - radioactive: terminal app to search and play radios


- Comando interesante para conectarse al wifi `iwmenu --launcher custom --launcher-command "wofi --dmenu --password"`
