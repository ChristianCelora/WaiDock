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

## Installazione

### File configurazione driver odbc

Creare 2 file **odbc.ini** e **odbcinst.ini** sotto la cartella odbc_driver con al loro interno le configurazioni dei 

## Prima esecuzione (problemi riscontrati sul WAI)

### Sessionauth 

Errore con il geoip_record_by_name(). Il contenitore di docker non ha come ip il 127.0.0.1.

Come risoluzione rimuovere temporaneamente l'if e andare sempre nel costrutto else

### DB Mysql

Per ora utilizzeremo il db sotto la macchina di sviluppo.

Cambiare i config.inc.php con l'ip della macchina di sviluppo (192.168.91.16)

### Connessione AS400

Aggiungere ai file config.inc.php la riga

```
$odbc_host = '172.31.212.240';
```

Sostituire la classe **OdbcStmt** nel file *include/connector_pdo.php* nel file *include/connector.php*