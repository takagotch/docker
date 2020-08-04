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

###### Install Docker for linux centos
```sh
// https://docs.docker.com/engine/install/centos/
$ sudo yum install -y yum-utils
$ sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo
sudo yum-config-manager --enable docker-ce-nightly
sudo yum-config-manager --enable docker-ce-test
sudo yum-config-manager --disable docker-ce-nightly

$ sudo yum install docker-ce docker-ce-cli containerd.io
$ sudo yum install docker-ce-<VERSION_STRING> docker-ce-cli-<VERSION_STRING> containerd.io
<VERSION_STRING>: docker-ce-18.09.1
sudo yum install /path/to/package.rpm

$ sudo systemctl start docker
$ sudo docker run hello-world



sudo yum remove docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-engine
sudo yum remove docker-ce docker-ce-cli containerd.io
sudo rm -rf /var/lib/docker

```

###### Install Docker-Compose for linux centos
```sh
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

