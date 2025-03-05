# Setup Inicial para Ubuntu Server 🚀

Este repositorio contiene un script automatizado para realizar la configuración inicial de un servidor Ubuntu desde cero.

## 📦 ¿Qué hace el script?

- Actualiza el sistema.
- Instala OpenSSH, UFW y Fail2Ban.
- Configura el firewall (UFW) para permitir acceso **solo desde una IP que vos elijas**.
- Instala `htop` para monitorear el servidor.

---

## ⚡ Cómo usarlo

### Opción 1: Descargar desde GitHub y ejecutarlo
```bash
wget https://raw.githubusercontent.com/arthion25/setup-servidor.sh/main/setup-servidor.sh
chmod +x setup-servidor.sh
sudo ./setup-servidor.sh
```
## Opción 2: Ejecutarlo directamente (sin guardar el archivo)
Si querés ejecutarlo directo desde GitHub, sin guardarlo, podés usar:

```bash
curl -s https://raw.githubusercontent.com/arthion25/setup-servidor.sh/main/setup-servidor.sh | sudo bash
```


