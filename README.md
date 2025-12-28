# Repositorio público
Scripts de inicio de instalación de sistemas linux. Ejecutar en una carpeta vacia.

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
__Acceso SSH__ al sistema con usuario admin (sudo).
* Instalación del cliente de Github
* Login al repositorio _privado de instalación_ (repositorio publico en proyecto)
* Clonado del repositorio
* Lanzado menu de opciones de instalación
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

