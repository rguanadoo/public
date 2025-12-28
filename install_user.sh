#!/bin/bash
# SCRIPT GITHUB + DEPLOY
# bash <(wget -qO - https://raw.githubusercontent.com/rguanadoo/public/refs/heads/main/install_user.sh)

# variables
echo token de acceso al repo
read -sp 'token: ' tokenvar
echo introduce el repositorio de rguanadoo
read -p 'repo: ' gitrepo
gituser=rguanadoo
# intalación gh client
sudo apt install net-tools rsync nano vim telnet curl git iputils-ping gh --yes

# echo API de acceso a git
# read -sp 'token: ' tokenvar
export GH_TOKEN=$tokenvar
gh auth login --with-token $GH_TOKEN

# comprobar token exportado
# gh config get -h github.com oauth_token

# clonar repo deploy
# read -p 'gituser: ' gitvar
# read -p 'repo: ' repovar
echo clon: $gituser/$gitrepo e inicio install
gh repo clone $gituser/$gitrepo

# reset token
#tokenvar=''
#export GH_TOKEN=$tokenvar

# iniciar deploy
bash <(cat $gitrepo/install.sh)
