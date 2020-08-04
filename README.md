### docker
---
https://docs.docker.com/get-started/part2/

https://www.docker.com/

#### docker-compose
#### docker-registry
#### dockerfile
#### docker-machine, docker-swarm
#### s3(aws), EC2

####
####

https://github.com/docker-library/official-images


```
https://github.com/takagotch/docker/blob/master/doc.txt

```

```sh
```

```
$ docker login
USERNAME
PASSWARD
$ docker images

$ docker pull takagotch/rails6
docker pull rails6
docker pull rails:latest
docker pull takagotch/rails:latest

$ docker tag rails takagotch/rails6
docker tag takagotch/rails6 tky/rails6

docker pull 

```

```
$ docker rmi IMAGEID
docker rmi -f IMAGEID

$ docker ps 
docker ps -a

$



```


```

```


```

```


```sh
// Install Docker-Compose
// $ su -
//   sudo yum update

$ sudo curl -L "https://github.com/docker/compose/releases/download/1.26.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

$ docker-compose --version

// Install Docker-Compose2
$ pip install docker-compose
sudo pip install docker-compose
sudo curl -L --fail https://github.com/docker/compose/releases/download/1.26.2/run.sh -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

docker-compose migrate-to-labels
docker container rm -f -v myapp_web_1 myapp_db_1 ...
sudo rm /usr/local/bin/docker-compose
pip uninstall docker-compose

// alpine
sudo yum install py-pip, python-dev, libffi-dev, openssl-dev, gcc, libc-dev, make
```

