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
(type -p wget >/dev/null || (sudo apt update && sudo apt install wget -y)) \
	&& sudo mkdir -p -m 755 /etc/apt/keyrings \
	&& out=$(mktemp) && wget -nv -O$out https://cli.github.com/packages/githubcli-archive-keyring.gpg \
	&& cat $out | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null \
	&& sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg \
	&& sudo mkdir -p -m 755 /etc/apt/sources.list.d \
	&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
	&& sudo apt update \
	&& sudo apt install gh -y

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
