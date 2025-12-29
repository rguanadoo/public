# Repositorio público
Scripts de inicio de instalación de sistemas linux. Ejecutar en una carpeta vacia.

## install_root.sh
Se ejecuta desde la __consola de sistema__, con usuario root.
* Actualización del sistema
* Instalación aplicaciónes básicas
* Añade usuario administrador (sudo)
* Reinicio del sistema
```bash
bash <(wget -qO - https://raw.githubusercontent.com/rguanadoo/public/refs/heads/main/install_root.sh)
```

## conf_sys.sh
__Acceso SSH__ al sistema con usuario admin (sudo).
* Cambio nombre del servidor
* Ajustar zona horaria Europe/Madrid
* Configura updates automáticos (pendiente)
* Agrega certificados CA local (pendiente)
* Reinicio del sistema
```bash
bash <(wget -qO - https://raw.githubusercontent.com/rguanadoo/public/refs/heads/main/conf_sys.sh)
```
## run_install.sh
__Acceso SSH__ al sistema con usuario admin (sudo).
* Instalación del cliente de Github
* Login al repositorio _privado de instalación_ (repositorio público en proyecto)
* Clonado del repositorio
* Lanzador _Menu de Opciones_ de instalación
```bash
bash <(wget -qO - https://raw.githubusercontent.com/rguanadoo/public/refs/heads/main/run_install.sh)
```

## actualizar repo
```bash
bash <(wget -qO - https://raw.githubusercontent.com/rguanadoo/public/refs/heads/main/git_login.sh)
```

## lanzar menu
pendiente mejora con awk
```bash
for dir in ${PWD}/*; do (cd "$dir" && bash <(cat install.sh)); done
```


### ejemplos
modo usuario
```bash
# bash <(wget -qO - http://website.com/my-script.sh)
```
modo root
```bash
# sudo su -c "bash <(wget -qO - http://website.com/my-script.sh)" root
```

