#!/bin/bash
### SCRIPT GITHUB + DEPLOY
### bash <(wget -qO - https://raw.githubusercontent.com/rguanadoo/public/refs/heads/main/install_user.sh)
### requiere gh: sudo apt install gh. Instaladoen 2_configure_sys.sh

## variables
echo introduce el repositorio a clonar: gituser/repo
read -p 'Git Repo: ' gitrepo
echo introducen el token de acceso al repo:
read -sp 'API Token: ' gittoken

## login en el repo
export GH_TOKEN=$gittoken
gh auth login --with-token $GH_TOKEN

## clonar repo
echo clon: $gitrepo e inicio install
gh repo clone $gitrepo

## reset token (opcional)
# gittoken=""
# export GH_TOKEN=$gittoken

## iniciar deploy 
# modificar si hay carpetas en la carpeta del usuario, o ejecutar en una carpeta vacia.

#### COMENTAR LA SIGUIENTE LINEA SI SE QUIERE REVISAR EL CODIGO ####
for dir in ${PWD}/*; do (cd "$dir" && bash <(cat install.sh)); done
