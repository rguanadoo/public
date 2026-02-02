#!/bin/bash
# Purpose: configure ubuntu24 VPS
# 02-02-2026 - Roberto Guanadoo
# bash <(wget -qO - https://raw.githubusercontent.com/rguanadoo/public/refs/heads/main/2_configure_sys.sh)

# variables
echo nombre del servidor:
read -p 'hostname: ' srvname
# echo ip nic virtual /24 - sin mascara
# read -p 'IpAddress: ' srvip
# read -p 'Gateway: ' srvgtw
# read -p 'DNS Local: ' srvdns

# intalación apps
echo basic apps
sudo apt install net-tools rsync nano vim dialog telnet git iputils-ping  --yes

# config hostname host y timezone
sudo hostnamectl hostname $srvname
# sudo sed -i 's/^127.0.1.1 .*$/127.0.1.1 '$srvname'/' /etc/hosts
sudo timedatectl set-timezone Europe/Madrid

# copia cert y configuración ssh


# reinicio
echo reinicio "$srvname" : 'ssh '$USER'@'$srvip''
sudo shutdown -r +1 "################## Reiniciando el sistema... ##################"
