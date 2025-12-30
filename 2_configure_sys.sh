#!/bin/bash
# Purpose: configure hostname ip network timezone dns
# 30-12-2025 - Roberto Guanadoo
# bash <(wget -qO - https://raw.githubusercontent.com/rguanadoo/public/refs/heads/main/2_configure_sys.sh)

# variables
echo nombre del servidor:
read -p 'hostname: ' srvname
echo ip del servidor clase c /24
read -p 'ipaddress c: ' srvip
echo gateway
read -p 'gateway: ' srvgtw
echo dns local
read -p 'dns: ' srvdns

# intalación apps
echo basic apps
sudo apt install net-tools rsync nano vim cron telnet git iputils-ping gh --yes

# config hostname host y timezone
sudo hostnamectl hostname $srvname
sudo sed -i 's/^127.0.1.1 .*$/127.0.1.1 '$srvname'/' /etc/hosts
sudo timedatectl set-timezone Europe/Madrid

# config dns server local
sudo mkdir /etc/systemd/resolved.conf.d
wget https://raw.githubusercontent.com/rguanadoo/public/refs/heads/main/conf/dns_local.conf
echo 'FallbackDNS='$srvdns'' >> dns_local.conf
sudo cp dns_local.conf /etc/systemd/resolved.conf.d/
sudo systemctl reload-or-restart systemd-resolved
# systemd-analyze cat-config systemd/resolved.conf

# unattended-upgrades
sudo apt install unattended-upgrades apt-utils 
sudo dpkg-reconfigure -plow unattended-upgrades
sudo cp config/50unattended-upgrades /etc/apt/apt.conf.d
sudo cp config/20auto-upgrades /etc/apt/apt.conf.d
sudo unattended-upgrades --dry-run --debug

# cambio de ip
wget https://raw.githubusercontent.com/rguanadoo/public/refs/heads/main/conf/50-cloud-init.yaml
sed -i 's/123.45.67.8/'$srvip'/' 50-cloud-init.yaml
sed -i 's/123.45.67.2/'$srvdns'/' 50-cloud-init.yaml
sed -i 's/123.45.67.1/'$srvgtw'/' 50-cloud-init.yaml
sudo mv 50-cloud-init.yaml /etc/netplan/

# reinicio
echo reinicio $hostname : 'ssh '$USER'@'$srvip''
sudo shutdown -r +1 "################## Reiniciando el sistema... ##################"
