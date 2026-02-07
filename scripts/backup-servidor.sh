#!/bin/bash

# =====================================================
# Script de Backup Automatizado com Limpeza
# Autor: Raydeman S. Sidon
# Objetivo: Backup compactado com controle de retenção
# =====================================================

# Diretório de origem
ORIGEM="/home"

# Diretório de destino
DESTINO="/backup"

# Data atual
DATA=$(date +"%Y-%m-%d_%H-%M-%S")

# Nome do arquivo
ARQUIVO="backup_$DATA.tar.gz"

# Arquivo de log
LOG="/var/log/backup_script.log"

# Dias de retenção
RETENCAO=7

echo "----------------------------------------" >> $LOG
echo "Início do backup: $DATA" >> $LOG

# Criar diretório se não existir
if [ ! -d "$DESTINO" ]; then
    mkdir -p $DESTINO
    echo "Diretório de backup criado." >> $LOG
fi

# Executar backup
tar -czpf $DESTINO/$ARQUIVO $ORIGEM 2>> $LOG

if [ $? -eq 0 ]; then
    echo "Backup realizado com sucesso: $ARQUIVO" >> $LOG
else
    echo "Erro ao realizar backup." >> $LOG
fi

# Limpeza automática de backups antigos
echo "Iniciando limpeza de backups antigos..." >> $LOG

find $DESTINO -type f -name "backup_*.tar.gz" -mtime +$RETENCAO -exec rm -f {} \; >> $LOG 2>&1

echo "Limpeza concluída. Backups com mais de $RETENCAO dias foram removidos." >> $LOG
echo "Fim do processo." >> $LOG
