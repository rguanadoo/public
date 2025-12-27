#!/bin/bash
# SCRIPT CONFIG BASE: update, apps, usuario
# curl -fsSL https://static.pangolin.net/get-installer.sh | bash && ./install_root.sh

# variables
echo usuario y password administrador
read -p 'usuario: ' uservar
read -sp 'password: ' passvar
echo Usuario admin del sistema:  $uservar.

# update os
apt update && apt upgrade --yes
apt install sudo rsync nano telnet net-tools curl wget git --yes

# usuario admin + reinicio
useradd -m -s /bin/bash $uservar -p $passvar
usermod -aG sudo $uservar
echo nuevo administrador: $uservar
echo reiniciando
sleep 2
shutdown -r now

