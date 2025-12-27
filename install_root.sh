#!/bin/bash
# SCRIPT CONFIG BASE: update, apps, usuario
# bash <(wget -qO - https://raw.githubusercontent.com/rguanadoo/public/refs/heads/main/install_root.sh)

# variables
echo usuario y password administrador
read -p 'usuario: ' uservar
read -sp 'password: ' passvar
echo Usuario admin del sistema:  $uservar.
pause
# update os
apt update && apt upgrade --yes
apt install sudo rsync nano telnet curl net-tools wget git --yes

# usuario admin + reinicio
useradd -m -s /bin/bash $uservar -p $passvar
usermod -aG sudo $uservar
echo nuevo administrador: $uservar
echo reiniciando...
shutdown -r -t 5


