#!/bin/bash
username=$(whoami)
cd /tmp

sudo MintMate $username
echo "Usuario Inicial"
whoami
