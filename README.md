# Repositorio público
Scripts de inicio de instalación de sistemas linux.

## install_root.sh
Se ejecuta desde la __consola de sistema__, con usuario root. \
* Actualización del sistema
* Instalación aplicaciónes básicas
* Añade usuario administrador (sudo)
* Reinicio del sistema
```bash
bash <(wget -qO - https://raw.githubusercontent.com/rguanadoo/public/refs/heads/main/install_root.sh)
```

## install_user.sh
__Acceso SSH__ al sistema con usuario con permisos de admin(sudo).
* Instalación del cliente de Github
* Conexión al repositorio de instalació
* Clonado del repositorio
* Inicio configuración del sistema y servicios.
```bash
bash <(wget -qO - https://raw.githubusercontent.com/rguanadoo/public/refs/heads/main/install_user.sh)
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

