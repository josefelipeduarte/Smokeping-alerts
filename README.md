
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
    
