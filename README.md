# Repositorio público
Scripts de inicio de instalación de sistemas linux.

## install_root.sh
Se ejecuta desde la __consola de sistema__, con usuario root. \
* Actualización del sistema
* Instalación aplicaciónes básicas
* Añade usuario administrador (sudo)
* Reinicio del sistema
```bash
curl -fsSL https://github.com/rguanadoo/public/blob/main/install_root.sh | bash && ./install_root.sh
```

## install_user.sh
Acceso SSH al sistema con usuario administrador.
* Instalación del cliente de Github
* Conexión al repositorio de instalació
* Clonado del repositorio
* Inicio configuración del sistema y servicios.

```bash
curl -fsSL https://github.com/rguanadoo/public/blob/main/install_user.sh | bash && ./install_user.sh
```
