
# SCRIPT ALERT SMOKEPING TELEGRAM

Script Smokeping para envio ao telegram, smokeping envia o Alerta para o script que verifica a cada 5 minutos e faz o envio para o grupo.




## Funcionalidades

- Envio alertas personalizados telegram.
- Preview em tempo real.
- Dinamica de 5 minutos antes do envio.


## Instalação

Crie um arquivo .sh e aponte nos arquivos os alertas
Arquivo Alerts do smokeping
- [Script de Alerta](https://github.com/josefelipeduarte/Smokeping-alerts/blob/main/Smokeping%20Script.sh)

Ao criar o ARQUIVO script.sh se atente a este ponto.
O SCRIPT DEVE SER CRIADO na pasta /op/smokeping/script.sh

OBS: Se não existir a pasta deve-se criar-la.

```bash
*** Alerts ***
to = |/opt/smokeping/script.sh
from = smokeping@example.com
```

- Exemplo de uso: no arquivo de Alerts
```bash
#Se detectado em duas verificações seguidas perca de pacote > 5% alerta.
+Perca_de_Pacotes
type = loss
# in percent
pattern = >5%,>5%
edgetrigger = yes
comment = Perca de > 5% 5 minutos.
```
- Exemplo de uso: no arquivo que deseja monitorar, neste caso monitoramos com dois alertas [Perca_de_Pacotes,latencia_alta] 

```bash
++ Peers-OP1-v4
title = Peer 01 - 165.19.240.254
host = 165.19.240.254
menu = Celerix1
alerts = Perca_de_Pacotes,latencia_alta
```
    
## Uso/Exemplos

No arquivo Alerts insira:
```javascript
#Para alerta de Hosts monitorados via DNS

+Perca_de_Pacotes_DNS
type = loss
# in percent
pattern =  >5%,>5%
edgetrigger = yes
comment = Perca de 2 periodos > 5%
```
```javascript
#Para hosts monitorados via IP

+Perca_de_Pacotes
type = loss
# in percent
pattern = >5%,>5%
edgetrigger = yes
comment = Perca de > 5% 5 minutos.
```
Um exemplo de latencia alta. Verificado 3x > 30 ms
```javascript
+latencia_DNS
type = rtt
# in milli seconds
pattern = >30,>30,>30
edgetrigger = yes
comment = Latencia alta demais?
```



## PERGUNTAS E RESPOSTAS

#### Como criar um BOT no telegram para usar na API?

- [Clique aqui](https://engage.sinch.com/pt-br/blog/como-criar-um-bot-do-telegram/#:~:text=Como%20criar%20e%20adicionar%20um%20bot%20ao%20Telegram,-Se%20você%20quer&text=Para%20usar%20o%20BotFather%2C%20basta,alguns%20comandos%20úteis%20em%20%2Fhelp.)



## Referência

 - [Api Telegram](https://core.telegram.org/)
 - [Smokeping MTR](https://github.com/catalyst/smokeping-mtr-alert)
 - [Smokeping Alerts](https://www.m00nie.com/how-to-configure-smokeping-alerts/)

