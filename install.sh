#!/bin/bash
username=$(whoami)
home=$PWD
cd /tmp
wget https://raw.githubusercontent.com/lctec/MintCustom/main/MintMate.sh
####################################### ejecucion con Sudo ########################################
#sudo bash MintMate.sh $username $home
LMflavor=$(cat /etc/linuxmint/info | grep EDITION)
cd /tmp

if [[ $LMflavor ==  *"Xfce"* ]]; then 
    ###################################### ejecucion con usuario PARA XFCE######################################
    # Monitoreo de cmabios en xfce
    #xfconf-query -c xfce4-desktop -m
    #xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitorVirtual1/workspace0/last-image -s /usr/share/backgrounds/linuxmint/Wallpaper.jpg
    #/usr/share/backgrounds/linuxmint/default_background.jpg'
elif [[ $LMflavor ==  *"MATE"* ]]; then
    ###################################### ejecucion con usuario PARA MATE######################################
    echo -e "${BRed}############ cambiar Fondo De Pantalla "
    #sudo -u$username -l dconf write /org/mate/desktop/background/picture-filename "'/usr/share/backgrounds/linuxmint/Wallpaper.jpg'"
    dconf write /org/mate/desktop/background/picture-filename "'/usr/share/backgrounds/linuxmint/Wallpaper.jpg'"
    wget https://raw.githubusercontent.com/lctec/MintCustom/main/guake.desktop
    mkdir ~/.config/autostart
    #chmod  700 ~/.config/autostart
    cp /tmp/guake.desktop ~/.config/autostart
    wget https://raw.githubusercontent.com/lctec/MintCustom/main/guake_prefs
    guake --restore-preferences /tmp/guake_prefs
fi





###################################### COMENTARIOS ######################################



    # save settings
    #guake --save-preferences /tmp/guake_prefs

    # load settings
    #guake --restore-preferences /tmp/guake_prefs
