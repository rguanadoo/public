#!/bin/bash
### SCRIPT GITHUB + DEPLOY
### bash <(wget -qO - https://raw.githubusercontent.com/rguanadoo/public/refs/heads/main/install_user.sh)

## variables

echo introduce el repositorio a clonar: gituser/repo
read -p 'Git Repo: ' gitrepo
echo introducen el token de acceso al repo:
read -sp 'token: ' tokenvar

## intalación gh client

sudo apt install net-tools rsync nano vim telnet curl git iputils-ping gh --yes

## login en el repo

export GH_TOKEN=$tokenvar
gh auth login --with-token $GH_TOKEN

## comprobar token exportado
# gh config get -h github.com oauth_token

## clonar repo

echo clon: $gitrepo e inicio install
gh repo clone $gitrepo

## reset token - opcional
#tokenvar=''
#export GH_TOKEN=$tokenvar

## iniciar deploy 
# modificar si hay directorios en la carpeta del usuario

for dir in ~/*; do (cd "$dir" && bash <(cat install.sh)); done
