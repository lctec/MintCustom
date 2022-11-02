#!/bin/bash
username=$(whoami)
home=$PWD
cd /tmp
wget https://raw.githubusercontent.com/lctec/MintCustom/main/MintMate.sh
sudo bash MintMate.sh $username $home
