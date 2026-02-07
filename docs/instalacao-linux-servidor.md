# Instalação e Configuração Inicial de Servidor Linux

## Objetivo

Documentar os passos básicos para instalação e configuração inicial de um servidor Linux.

---

## Etapas Realizadas

1. Atualização do sistema:
   sudo apt update && sudo apt upgrade -y

2. Criação de usuário administrativo:
   sudo adduser administrador
   sudo usermod -aG sudo administrador

3. Configuração de firewall (UFW):
   sudo apt install ufw
   sudo ufw allow OpenSSH
   sudo ufw enable

4. Configuração de hostname:
   sudo hostnamectl set-hostname servidor-ti

5. Verificação de serviços ativos:
   systemctl list-units --type=service

---

## Considerações

A configuração inicial adequada garante maior segurança, organização e estabilidade do ambiente.
