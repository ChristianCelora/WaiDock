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

Docker compose risolve automaticamente i container_name con il loro ip siccome sono sotto lo stesso network. 

### Versione docker-compose
La build necessita una versione di docker-compose > 1.6

### Upgrade docker-compose

Rimuove la versione installata
```
sudo apt-get remove docker-compose # se installato con apt-get
sudo rm /usr/local/bin/docker-compose # Se installato con curl
pip uninstall docker-compose # Se installato con pip
```

Controlla la versione e la salva per l'installazione
```
VERSION=$(curl --silent https://api.github.com/repos/docker/compose/releases/latest | grep -Po '"tag_name": "\K.*\d')
```

Salva il apth di destinazione dell'installazione
```
DESTINATION=/usr/local/bin/docker-compose
```

Installa docker-compose con l'ultime versione
```
sudo curl -L https://github.com/docker/compose/releases/download/${VERSION}/docker-compose-$(uname -s)-$(uname -m) -o $DESTINATION
sudo chmod 755 $DESTINATION
```

## Installazione

### File configurazione driver odbc

Creare 2 file **odbc.ini** e **odbcinst.ini** sotto la cartella odbc_driver con al loro interno le configurazioni del driver ODBC

## Prima esecuzione (problemi riscontrati sul WAI)

### Sessionauth 

Errore con il geoip_record_by_name(). Il contenitore di docker non ha come ip il 127.0.0.1.

Come risoluzione rimuovere temporaneamente l'if e andare sempre nel costrutto else

### DB Mysql

Per ora utilizzeremo il db sotto la macchina di sviluppo.

Cambiare i *config.inc.php* con l'ip della macchina di sviluppo (192.168.91.16)

Per utilizzare il contenitore db effettuare un export del db come file mysql e importare il db all'interno del docker.
Il db è persistente anche se si spegne il docker. 

Nel file *config.inc.php* inserire il nome del container mysql (wai_mysql)

### Connessione AS400

Aggiungere ai file config.inc.php la riga

```
$odbc_host = '172.31.212.240';
```

Sostituire la classe **OdbcStmt** nel file *include/connector_pdo.php* nel file *include/connector.php*