#!/bin/bash
# Purpose: install docker engine lazydocker docker-compose 1.22 user docker perm
# 30-12-2025 - Roberto Guanadoo
# bash <(wget -qO - https://raw.githubusercontent.com/rguanadoo/public/refs/heads/main/add_docker.sh)

# DOCKER ENGINE
sudo curl https://get.docker.com | sh

# permisos usuario docker
sudo usermod -aG docker $USER

# LAZYDOKER
#!/bin/bash
# allow specifying different destination directory
DIR="/usr/local/bin"

# map different architecture variations to the available binaries
ARCH=$(uname -m)
case $ARCH in
    i386|i686) ARCH=x86 ;;
    armv6*) ARCH=armv6 ;;
    armv7*) ARCH=armv7 ;;
    aarch64*) ARCH=arm64 ;;
    amd64*) ARCH=x86_64 ;;
esac

# prepare the download URL
GITHUB_LATEST_VERSION=$(curl -L -s -H 'Accept: application/json' https://github.com/jesseduffield/lazydocker/releases/latest | sed -e 's/.*"tag_name":"\([^"]*\)".*/\1/')
GITHUB_FILE="lazydocker_${GITHUB_LATEST_VERSION//v/}_$(uname -s)_${ARCH}.tar.gz"
GITHUB_URL="https://github.com/jesseduffield/lazydocker/releases/download/${GITHUB_LATEST_VERSION}/${GITHUB_FILE}"

# install/update the local binary
curl -L -o lazydocker.tar.gz $GITHUB_URL
tar xzvf lazydocker.tar.gz lazydocker
sudo install -Dm 755 lazydocker -t "$DIR"
rm lazydocker lazydocker.tar.gz

# DOCKER-COMPOSE
#!/bin/sh
set -e
sudo curl -L https://github.com/docker/compose/releases/download/v5.0.2/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version

# reinicio
echo reinicio 
sudo shutdown -r +1 "################## Reiniciando el sistema... ##################"

