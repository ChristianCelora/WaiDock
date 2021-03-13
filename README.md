# WaiDock
Fenicia wai dev enviorment

## Pre-checks

### Porte Libere
Controllare le porte utilizzate dalla macchina con il comando:
```
sudo lsof -i -P -n | grep LISTEN
sudo netstat -pna | grep <port_number>  # Alternativa
```

### Ip Database
Controllare l'IP assegnato al contenitore del DB con il comando:
```
docker inspect wai_mysql | grep IPAddress
```