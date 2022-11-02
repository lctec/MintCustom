#!/bin/bash
#################################################################################
#######################  ejecutado con sudo   ###################################
#################################################################################

####################### DECLARACION VARIABLES ###################################
# Bold
BBlack='\033[1;30m'       # Black
BRed='\033[1;31m'         # Red
BGreen='\033[1;32m'       # Green
BYellow='\033[1;33m'      # Yellow
BBlue='\033[1;34m'        # Blue
BPurple='\033[1;35m'      # Purple
BCyan='\033[1;36m'        # Cyan
BWhite='\033[1;37m'       # White

username=$1
home=$2
####################### DECLARACION FUNCIONES ###################################
function PAUSE(){
 read -s -n 1 -p "Press any key to continue . . ."
 echo ""
 clear
}
#################################################################################

echo -e "${BRed}### SELECCCIONAR REPOSITORIOS RAPIDOS DE FORMA MANUAL"
PAUSE
software-sources
#################################################################################
echo  Se Desinstalaran los programas innecesarios
PAUSE
cd /tmp
apt update
apt remove firefox* pidgin* hexchat* -y
apt autoclean -y
apt autoremove -y

echo -e "${BRed}#################### Quit Splash Screen  ###################"
PAUSE 
cp /etc/default/grub /etc/default/grub.old
sed -i '/GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"/c\GRUB_CMDLINE_LINUX_DEFAULT="noquiet nosplash"' /etc/default/grub
update-grub2

echo -e "${BRed}########### Actualizacion del SO "
PAUSE
apt upgrade -y
 
echo -e "${BRed}########### Instalacion y Configuracion de Aplicaciones"
apt install htop vim guake qbittorrent gparted -y
sudo -u$username wget https://raw.githubusercontent.com/lctec/MintCustom/main/guake.desktop
sudo -u$username cp /tmp/guake.desktop ~/.config/autostart
sudo -u$username wget https://raw.githubusercontent.com/lctec/MintCustom/main/guake_prefs
sudo -u$username guake --restore-preferences /tmp/guake_prefs


echo -e "${BRed}############ cambiar Fondo De Pantalla "
PAUSE
sudo -u$username wget https://raw.githubusercontent.com/lctec/MintCustom/main/Wallpaper.jpg
cp Wallpaper.jpg /usr/share/backgrounds/linuxmint
sudo -u$username dconf write /org/mate/desktop/background/picture-filename "'/usr/share/backgrounds/linuxmint/Wallpaper.jpg'"

echo -e "${BRed}############ Instalacion de Google Chrome"
PAUSE
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo add-apt-repository "deb http://dl.google.com/linux/chrome/deb/ stable main"
sudo apt update
sudo apt install google-chrome-stable -y

echo -e "${BRed}############ Instalacion De Microsoft Edge"
echo -e "${BRed}###########  Instalacion de Microsoft Code"
PAUSE
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
#wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg

sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/edge stable main" > /etc/apt/sources.list.d/microsoft-edge-dev.list'
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo rm microsoft.gpg
sudo apt-get install apt-transport-https
sudo apt update && sudo apt install microsoft-edge-stable -y
sudo apt-get install code -y # or code-insiders

#wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
#sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
#sudo sh -c 'echo "deb [arch=amd64 signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
#sudo apt-get install apt-transport-https
#sudo apt-get update
#sudo apt-get install code -y # or code-insiders

## alternativa Chromium 
## sudo apt install chromium-browser

# save settings
#guake --save-preferences /tmp/guake_prefs

# load settings
#guake --restore-preferences /tmp/guake_prefs
