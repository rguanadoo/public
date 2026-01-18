# Repositorio público
Scripts de inicio de instalación de _Ubuntu 24.04.3 LTS (GNU/Linux 6.8.0-90-generic x86_64)_. \
Realiza la configuración básica e instalación de docker engine y utilidades.

Directorio _conf_: templates de ficheros del sistema.

## add_useradm.sh
Se ejecuta desde la __consola de sistema__, con usuario root.
* Actualización del sistema
* Instala sudo
* Añade usuario administrador (sudo)
* Reinicio del sistema
```bash
bash <(wget -qO - https://raw.githubusercontent.com/rguanadoo/public/refs/heads/main/scripts/useradm.sh)
```

## configure_sys.sh
__Acceso SSH__ al sistema con usuario admin (sudo).
* Instala aplicaciones basicas
* Cambio nombre del servidor
* Ajustar zona horaria Europe/Madrid
* Actualizaciones automáticas
* Configuración red local y resolv.conf
* Reinicio del sistema
```bash
bash <(wget -qO - https://raw.githubusercontent.com/rguanadoo/public/refs/heads/main/scripts/configure_sys.sh)
```

## instalar docker y utils
* Instala docker engine
* Lazydocker
* docker-compose
* permisos docker al usuario
* creación carpeta de __stacks__
* configuración script start (@reboot crontab) y stop de containers en la carpeta stacks y creación de redes docker.
```bash
bash <(wget -qO - https://raw.githubusercontent.com/rguanadoo/public/refs/heads/main/scripts/conf_docker.sh)
```

## deploy.sh - acceso github privado
__Acceso SSH__ al sistema con usuario admin (sudo).
* Login al repositorio _privado de instalación_ (repositorio público en proyecto)
* Clonado del repositorio
* Lanzador _Menu de Opciones_ de instalación
```bash
bash <(wget -qO - https://raw.githubusercontent.com/rguanadoo/public/refs/heads/main/scripts/deploy.sh)
```
__lanzar menu__ (pendiente mejora awk)
```bash
for dir in ${PWD}/*; do (cd "$dir" && bash <(cat install.sh)); done
```

__referencias__
modo usuario
```bash
# bash <(wget -qO - http://website.com/my-script.sh)
```
modo root
```bash
# sudo su -c "bash <(wget -qO - http://website.com/my-script.sh)" root
```

