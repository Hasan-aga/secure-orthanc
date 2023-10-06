## mariadb encryption

### 
docker-compose.yml
	- create a mariadb container
	- add new volume for the keyfile ok
	- add new volume for mariadb cnf ok
	- the db can be saved via orthanc volume
	
```
  mariadb:
      image: mariadb:latest
      environment:
        MYSQL_ROOT_PASSWORD: rootpassword
        MYSQL_DATABASE: orthancdb
      ports:
        - "3300:3306"
      volumes:
        - ./mysqldb:/var/lib/mysql
        - ./my.cnf:/etc/mysql/my.cnf
        - ./keyfile:/etc/mysql/encryption/keyfile
      healthcheck:
        test: ["CMD", "mysqladmin", "ping", "-h", "localhost"]
        timeout: 20s
        retries: 10
    
```
my.cnf
keyfile
create_encryption_keys.sh