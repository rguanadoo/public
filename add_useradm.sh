#!/bin/bash
# Purpose: update system + add sudo user
# 30-12-2025 - Roberto Guanadoo
# bash <(wget -qO - https://raw.githubusercontent.com/rguanadoo/public/refs/heads/main/add_useradm.sh)

# variables
echo usuario y password nuevo administrador
ipcli=$(hostname -I | cut -d' ' -f1)
read -p 'usuario: ' useradm
read -sp 'password: ' userpass
echo Usuario admin del sistema:  $useradm

# update os
apt update && apt upgrade --yes
apt install sudo --yes

# usuario admin + reinicio
useradd -m -s /bin/bash $useradm -p $userpass
usermod -aG sudo $useradm
echo acceso ssh: 'ssh '$useradm'@'$ipcli''
shutdown -r +1 "################## Reiniciando el sistema... ##################"
