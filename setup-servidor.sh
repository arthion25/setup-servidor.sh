#!/bin/bash

# Actualiza e instala paquetes básicos
echo "Actualizando el sistema..."
sudo apt-get update && sudo apt-get upgrade -y
echo "Sistema actualizado..."

# Instalar OpenSSH si no está
echo "Instalando OpenSSH Server..."
sudo apt-get install -y openssh-server

# Habilitar y arrancar SSH
sudo systemctl enable ssh
sudo systemctl start ssh

# Instalar UFW (Firewall) y configurar reglas
echo "Configurando Firewall UFW..."
sudo apt-get install -y ufw
sudo ufw default deny incoming
sudo ufw default allow outgoing

# Permitir SSH, HTTP y HTTPS solo desde tu IP
MI_IP="192.168.1.60"
echo "Permitiendo acceso desde $MI_IP..."
sudo ufw allow from $MI_IP to any port 22
sudo ufw allow from $MI_IP to any port 80
sudo ufw allow from $MI_IP to any port 443
sudo ufw enable

# Instalar fail2ban para proteger SSH
echo "Instalando fail2ban..."
sudo apt-get install -y fail2ban
sudo systemctl enable fail2ban
sudo systemctl start fail2ban

# Instalar htop para monitoreo rápido
echo "Instalando htop..."
sudo apt-get install -y htop


# Mostrar resumen final
echo "Configuración completada."
#echo "Recordá conectarte con: ssh linux@tu-servidor"
echo "Tu IP permitida es: $MI_IP"
