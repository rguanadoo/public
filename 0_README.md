# Repositorio público
Scripts de inicio de instalación de sistemas linux. Ejecutar en una carpeta vacia.

## add_useradm.sh
Se ejecuta desde la __consola de sistema__, con usuario root.
* Actualización del sistema
* Instala sudo
* Añade usuario administrador (sudo)
* Reinicio del sistema
```bash
bash <(wget -qO - https://raw.githubusercontent.com/rguanadoo/public/refs/heads/main/1_add_useradm.sh)
```

## configure_sys.sh
__Acceso SSH__ al sistema con usuario admin (sudo).
* Instala aplicaciones basicas
* Cambio nombre del servidor
* Ajustar zona horaria Europe/Madrid
* Reinicio del sistema
```bash
bash <(wget -qO - https://raw.githubusercontent.com/rguanadoo/public/refs/heads/main/2_configure_sys.sh)
```
__lanzar menu__ (pendiente mejora awk)
```bash
for dir in ${PWD}/*; do (cd "$dir" && bash <(cat install.sh)); done
```

## deploy.sh
__Acceso SSH__ al sistema con usuario admin (sudo).
* Login al repositorio _privado de instalación_ (repositorio público en proyecto)
* Clonado del repositorio
* Lanzador _Menu de Opciones_ de instalación
```bash
bash <(wget -qO - https://raw.githubusercontent.com/rguanadoo/public/refs/heads/main/3_deploy.sh)
```
### instalar docker y utils
```bash
bash <(wget -qO - https://raw.githubusercontent.com/rguanadoo/public/refs/heads/main/add_docker.sh)
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

