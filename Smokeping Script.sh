#!/bin/bash

# Configurações do Telegram
TOKEN="7293859892:AAHE2WhyllMXZe1DDqsb_AdC0JvjwNbBEBX"
CHAT_ID="-1002302976435"

# Função para registrar o último alerta e enviar somente se necessário
enviar_alerta() {
  REGRA="$1"
  MENSAGEM="$2"

  ARQUIVO_TEMPO="/tmp/smoke_alert_${REGRA}.time"
  INTERVALO=300  # Tempo mínimo entre alertas (segundos)

  # Verificar o último alerta
  ULTIMO_ALERTA=$(cat "$ARQUIVO_TEMPO" 2> /dev/null || echo 0)
  TEMPO_ATUAL=$(date +%s)

  # Enviar alerta somente se o intervalo mínimo tiver passado
  if (( TEMPO_ATUAL - ULTIMO_ALERTA > INTERVALO )); then
    # Enviar alerta via Telegram
    curl -s -X POST https://api.telegram.org/bot$TOKEN/sendMessage -d chat_id=$CHAT_ID -d text="$MENSAGEM" > /dev/null 2>&1
    echo "$TEMPO_ATUAL" > "$ARQUIVO_TEMPO"
  fi
}


# ---  seu código original ---

alertname=$1 #nome da função tipo +someloss
target=$2 #Local.AlertDemo nome do host do smokeping
losspattern=$3 #quantidade de Loss ex 5% perca de pacote
rtt=$4
hostname=$5 #nome do  host

hora=$(date +"%H:%M:%S")
data_ocorrido=$(date +"%d-%m-%Y")

# Extrair o nome do host usando 'awk'
hostname=$(echo "$target" | awk -F '.' '{print $2}')

# Extrair o % packet loss usando 'awk'
loss=$(echo "$losspattern" | awk -F ':' '{print $2}')

# Extrair o numero usando 'awk'
ms=$(echo "$rtt" | awk -F ':' '{print $2}')


# Mensagem de alerta
MENSAGEM="🚨 ► ALERTA Smokeping - $hostname ◄  🚨
 
Problema: $alertname 

Perca %: $loss
RTT ms: $ms

Hora: $hora
Data: $data_ocorrido!"




# Chamar a função para enviar a mensagem, controlando a repetição
enviar_alerta "$alertname-$hostname" "$MENSAGEM"