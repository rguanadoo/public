#!/bin/bash
# SCRIPT GITHUB + DEPLOY
# bash <(wget -qO - https://raw.githubusercontent.com/rguanadoo/public/refs/heads/main/install_user.sh)

# variables
echo token de acceso al repo
read -sp 'token: ' tokenvar
echo usuario y repo: usuario/repo
echo introduce el usuario:
read -p 'usuario: ' gitvar
echo introduce el repositorio
read -p 'repo: ' repovar

# intalación gh client
sudo apt install gh

# echo API de acceso a git
# read -sp 'token: ' tokenvar
export GH_TOKEN=$tokenvar
gh auth login --with-token $GH_TOKEN

# comprobar token exportado
# gh config get -h github.com oauth_token

# clonar repo deploy
# read -p 'gituser: ' gitvar
# read -p 'repo: ' repovar
echo clon: $gitvar/$repovar
gh repo clone $gitvar/$repovar

# iniciar deploy
bash <( $repovar/install.sh)
