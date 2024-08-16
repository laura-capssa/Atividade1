#!/bin/bash

# Configurações
LOG_DIR="/mnt/nfs/laura"
TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")
SERVICE="httpd" 
STATUS=$(systemctl is-active httpd)

# Mensagens personalizadas
ONLINE_MESSAGE="Apache está online."
OFFLINE_MESSAGE="Apache está offline."

# Verificar o status do serviço e gerar os logs
if [ "$STATUS" == "active" ]; then
    echo "Data e Hora: $TIMESTAMP" > "$LOG_DIR/apache_online.log"
    echo "Nome do Serviço: $SERVICE" >> "$LOG_DIR/apache_online.log"
    echo "Status: ONLINE" >> "$LOG_DIR/apache_online.log"
    echo "Mensagem: $ONLINE_MESSAGE" >> "$LOG_DIR/apache_online.log"
else
    echo "Data e Hora: $TIMESTAMP" > "$LOG_DIR/apache_offline.log"
    echo "Nome do Serviço: $SERVICE" >> "$LOG_DIR/apache_offline.log"
    echo "Status: OFFLINE" >> "$LOG_DIR/apache_offline.log"
    echo "Mensagem: $OFFLINE_MESSAGE" >> "$LOG_DIR/apache_offline.log"
fi



