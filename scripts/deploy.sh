#!/bin/bash
# Purpose: login en github clonado repo start_menu
# 30-12-2025 - Roberto Guanadoo
# requiere gh: sudo apt install gh. Instalado en 2_configure_sys.sh
# bash <(wget -qO - https://raw.githubusercontent.com/rguanadoo/public/refs/heads/main/3_deploy.sh)

# variables
echo introduce el repositorio a clonar: gituser/repo
read -p 'Git Repo: ' gitrepo
echo introducen el token de acceso al repo:
read -sp 'API Token: ' gittoken
repo=$(echo $gitrepo | awk -F "/" '{print $2}')

# login en el repo
export GH_TOKEN=$gittoken
gh auth login --with-token $GH_TOKEN

# clonar repo
echo clon: $gitrepo e inicio install
gh repo clone $gitrepo

# reset token (opcional)
# gittoken=""
# export GH_TOKEN=$gittoken

# iniciar menu 
bash <(cat $repo/scripts/menu.sh)

# for dir in ${PWD}/*; do (cd "$dir" && bash <(cat install.sh)); done
