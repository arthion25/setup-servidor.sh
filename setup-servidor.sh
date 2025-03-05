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

# Pedir al usuario la IP permitida para el firewall
read -p "Ingresá la IP que tendrá acceso SSH, HTTP y HTTPS: " MI_IP

# Instalar UFW (Firewall) y configurar reglas
echo "Configurando Firewall UFW..."
sudo apt-get install -y ufw
sudo ufw default deny incoming
sudo ufw default allow outgoing

# Permitir SSH, HTTP y HTTPS solo desde la IP ingresada
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

# Mostrar estado final del firewall
echo "=============================="
echo "Estado actual del firewall (UFW):"
sudo ufw status
echo "=============================="

# Mostrar estado de Fail2Ban
echo "Estado de fail2ban:"
sudo systemctl status fail2ban --no-pager

# Mostrar estado de SSH
echo "Estado del servicio SSH:"
sudo systemctl status ssh --no-pager

# Mostrar mensaje final
echo "=============================="
echo "Configuración completada."
echo "La IP permitida para acceso remoto es: $MI_IP"
echo "=============================="
