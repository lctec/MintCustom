#!/bin/bash
username=$(whoami)
home=$PWD
cd /tmp
wget https://raw.githubusercontent.com/lctec/MintCustom/main/MintMate.sh
sudo bash MintMate.sh $username $home
dconf write /org/mate/desktop/background/picture-filename "'/usr/share/backgrounds/linuxmint/Wallpaper.jpg'"