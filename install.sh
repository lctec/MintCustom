#!/bin/bash
username=$(whoami)
home=$(PWD)
cd /tmp
wget https://raw.githubusercontent.com/lctec/MintMate/main/MintMate.sh
sudo MintMate.sh $username $home
