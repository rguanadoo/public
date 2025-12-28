#!/bin/bash
# SCRIPT CONFIG BASE: update, apps, usuario
# bash <(wget -qO - https://raw.githubusercontent.com/rguanadoo/public/refs/heads/main/install_root.sh)

# variables
echo usuario y password administrador
$ipcli=(hostname -I | cut -d' ' -f1)
read -p 'usuario: ' useradm
read -sp 'password: ' userpass
echo Usuario admin del sistema:  $useradm

# update os
apt update && apt upgrade --yes
apt install sudo rsync nano telnet curl net-tools wget git --yes

# usuario admin + reinicio
useradd -m -s /bin/bash $useradm -p $userpass
usermod -aG sudo $useradm
echo acceso ssh: 'ssh '$useradm'@'$ipcli''
shutdown -r +1 "################## Reiniciando el sistema... ##################"
