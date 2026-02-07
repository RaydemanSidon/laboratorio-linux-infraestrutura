#!/bin/bash

# =====================================================
# Script de Backup Automatizado
# Autor: Raydeman S. Sidon
# Objetivo: Realizar backup compactado com registro em log
# =====================================================

# Diretório que será copiado
ORIGEM="/home"

# Diretório onde os backups serão armazenados
DESTINO="/backup"

# Data atual
DATA=$(date +"%Y-%m-%d_%H-%M-%S")

# Nome do arquivo de backup
ARQUIVO="backup_$DATA.tar.gz"

# Arquivo de log
LOG="/var/log/backup_script.log"

echo "----------------------------------------" >> $LOG
echo "Início do backup: $DATA" >> $LOG

# Verifica se o diretório de destino existe
if [ ! -d "$DESTINO" ]; then
    mkdir -p $DESTINO
    echo "Diretório de backup criado." >> $LOG
fi

# Executa o backup
tar -czpf $DESTINO/$ARQUIVO $ORIGEM 2>> $LOG

# Verifica se o backup foi bem-sucedido
if [ $? -eq 0 ]; then
    echo "Backup realizado com sucesso: $ARQUIVO" >> $LOG
else
    echo "Erro ao realizar backup." >> $LOG
fi

echo "Fim do backup." >> $LOG

