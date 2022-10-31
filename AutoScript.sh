####################### DECLARACION FUNCIONES ###################################################################
function PAUSE(){
 read -s -n 1 -p "Press any key to continue . . ."
 echo ""
 clear
}
##############################################################################################################

echo #### SELECCCIONAR REPOSITORIOS RAPIDOS
software-sources

pause
cd /tmp
apt update
echo  Se Desinstalaran los programas innecesarios
PAUSE 

echo ##################### Quit Splash Screen  ################### 
cp /etc/default/grub /etc/default/grub.old
sed -i '/GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"/c\GRUB_CMDLINE_LINUX_DEFAULT="noquiet nosplash"' /etc/default/grub
update-grub2

##Desinstalacion de Todo lo que no se va a a Usar
sudo apt remove firefox* -y
sudo apt purge firefox* -y
sudo apt autoclean -y
sudo apt autoremove -y

echo "############ Actualizacion del SO "
PAUSE
apt upgrade -y
 
echo "############ Instalacion y Configuracion de Aplicaciones"
apt install htop vim guake qbittorrent -y
wget https://raw.githubusercontent.com/lctec/MintMate/main/guake.desktop
cp /tmp/guake.desktop ~/.config/autostart
wget https://raw.githubusercontent.com/lctec/MintMate/main/guake_prefs
guake --restore-preferences /tmp/guake_prefs


echo  "############ cambiar Fondo De Pantalla "
PAUSE
wget https://github.com/lctec/MintMate/raw/main/Wallpaper.jpg
dconf write /org/mate/desktop/background/picture-filename "'/tmp/Wallpaper.jpg'"

echo  "############ Instalacion de Google Chrome"
PAUSE
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo add-apt-repository "deb http://dl.google.com/linux/chrome/deb/ stable main"
sudo apt update
sudo apt install google-chrome-stable -y

echo  "############ Instalacion De Microsoft Edge"
echo "############  Instalacion de Microsoft Code"
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
