#!/bin/bash
### System basic
### bash <(wget -qO - https://raw.githubusercontent.com/rguanadoo/public/refs/heads/main/start_sys.sh)

## variables
echo nombre del servidor:
read -p 'hostname: ' srvname
# pendiente cambio de ip

## intalación apps
echo basic apps
sudo apt install net-tools rsync nano vim cron telnet git iputils-ping gh --yes

# config hostname host y timezone
sudo hostnamectl hostname $srvname
sudo sed -i 's/^127.0.1.1 .*$/127.0.1.1 '$srvname'/' /etc/hosts
sudo timedatectl set-timezone Europe/Madrid

# REINICIO
export ipcli=$( hostname -I | cut -d' ' -f1)
echo reinicio newname: 'ssh '$USER'@'$ipcli''
sudo shutdown -r +1 "################## Reiniciando el sistema... ##################"
