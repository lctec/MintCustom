#!/bin/bash
username=$(whoami)
home=$PWD
cd /tmp
wget https://raw.githubusercontent.com/lctec/MintCustom/main/MintMate.sh
sudo bash MintMate.sh $username $home


echo -e "${BRed}############ cambiar Fondo De Pantalla "
PAUSE
sudo -u$username wget https://raw.githubusercontent.com/lctec/MintCustom/main/Wallpaper.jpg
cp Wallpaper.jpg /usr/share/backgrounds/linuxmint
#sudo -u$username -l dconf write /org/mate/desktop/background/picture-filename "'/usr/share/backgrounds/linuxmint/Wallpaper.jpg'"
dconf write /org/mate/desktop/background/picture-filename "'/usr/share/backgrounds/linuxmint/Wallpaper.jpg'"

wget https://raw.githubusercontent.com/lctec/MintCustom/main/guake.desktop
cp /tmp/guake.desktop ~/.config/autostart
wget https://raw.githubusercontent.com/lctec/MintCustom/main/guake_prefs
guake --restore-preferences /tmp/guake_prefs