## intro
this repo contains branches for each test I made. I made a test for securing Orthanc with Postgres and Mariadb. I failed to encrypt Postgres (maybe can be done) but encrypting Mariadb was easy enough (using TDE).

Another test that needs to be done is securing orthanc by encrypting the docker volume on which it is mount.

## encrypting docker volume
we have a docker volume at ./filedb, how can we encrypt it?
```
sudo apt-get install cryptsetup
dd if=/dev/zero of=./encrypted-file bs=1M count=1024
```
then we create a loopback device (choose a loopback number that is not in-use by checking lsblk's output)
```
sudo losetup /dev/loop0 ./encrypted-file
sudo cryptsetup luksFormat /dev/loop0

```
passphrase test
```
sudo cryptsetup luksOpen /dev/loop0 my-encrypted-volume
sudo mkfs.ext4 /dev/mapper/my-encrypted-volume

```
then 
```
docker-compose down
docker-compose up
```