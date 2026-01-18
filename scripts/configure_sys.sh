#!/bin/bash
# Purpose: configure hostname ip network timezone dns
# 30-12-2025 - Roberto Guanadoo
# bash <(wget -qO - https://raw.githubusercontent.com/rguanadoo/public/refs/heads/main/2_configure_sys.sh)

# variables
echo nombre del servidor:
read -p 'hostname: ' srvname
echo ip sin mascara
read -p 'IpAddress: ' srvip
read -p 'Gateway: ' srvgtw
read -p 'DNS Local: ' srvdns

# intalación apps
echo basic apps
sudo apt install net-tools rsync nano vim cron dialog telnet git iputils-ping gh --yes

# config hostname host y timezone
sudo hostnamectl hostname $srvname
sudo sed -i 's/^127.0.1.1 .*$/127.0.1.1 '$srvname'/' /etc/hosts
sudo timedatectl set-timezone Europe/Madrid

# config dns server local
sudo mkdir /etc/systemd/resolved.conf.d
wget https://raw.githubusercontent.com/rguanadoo/public/refs/heads/main/conf/dns_local.conf
echo 'FallbackDNS='$srvdns'' >> dns_local.conf
sudo mv dns_local.conf /etc/systemd/resolved.conf.d/
sudo systemctl reload-or-restart systemd-resolved
# systemd-analyze cat-config systemd/resolved.conf

# unattended-upgrades
sudo apt install unattended-upgrades apt-utils --yes
sudo dpkg-reconfigure -plow unattended-upgrades
sudo curl -L https:
sudo curl -L https://raw.githubusercontent.com/rguanadoo/public/refs/heads/main/conf/50unattended-upgrades -o /etc/apt/apt.conf.d/50unattended-upgrades
sudo curl -L https://raw.githubusercontent.com/rguanadoo/public/refs/heads/main/conf/20auto-upgrades -o /etc/apt/apt.conf.d/20auto-upgrades
sudo unattended-upgrades --dry-run --debug

# cambio de ip
wget https://raw.githubusercontent.com/rguanadoo/public/refs/heads/main/conf/50-cloud-init.yaml
sed -i 's/123.45.67.8/'$srvip'/' 50-cloud-init.yaml
sed -i 's/123.45.67.2/'$srvdns'/' 50-cloud-init.yaml
sed -i 's/123.45.67.1/'$srvgtw'/' 50-cloud-init.yaml
sudo mv 50-cloud-init.yaml /etc/netplan/
echo config de red pendiente de reincio
echo IP: $srvip/24
echo GTW: $srvgtw
echo DNS: $srvdns

# reinicio
echo reinicio "$srvname" : 'ssh '$USER'@'$srvip''
sudo shutdown -r +1 "################## Reiniciando el sistema... ##################"
