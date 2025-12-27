#!/bin/bash
# SCRIPT CONFIG BASE: update, apps, usuario
# wget -qO - https://raw.githubusercontent.com/rguanadoo/public/refs/heads/main/install_root.sh | bash

# variables
echo usuario y password administrador
read 'usuario: ' uservar
read -p 'password: ' passvar
echo Usuario admin del sistema:  $uservar.

# update os
apt update && apt upgrade --yes
apt install sudo rsync nano telnet curl net-tools wget git --yes

# usuario admin + reinicio
useradd -m -s /bin/bash $uservar -p $passvar
usermod -aG sudo $uservar
echo nuevo administrador: $uservar
echo reiniciando...
shutdown -r -t 5


