docker image build -t example/cronjob:latest .
docker container run -d --rm --name cronjob ex/cronjob:latest
docker container exec -it cronjob tail -f /var/log/cron.log

docker container run -v ${PWD}:/workspace tky/imagemagick:latest convert -size 100x100 xc:$000000 /workspace/tky.jpg
ls -l
docker container run -d -p 8080:8080 -v ${PWD}/enkins_home:/var/jenkins_home jenkins:latest

docker image buildt -t tky/mysql-data:latest .
docker container run -d --name mysql-data tkky/mysql-data:latest
docker container run -d --rm --name mysql \
	-e "MYSQL_ALLOW_EMPTY_PASSWORD=yes" \
	-e "MYSQL_DATABASE=volume_test" \
	-e "MYSQL_USER=example" \
	-e "MYSQL_PASSWORD=example" \
	--volume-from mysql-data \
	mysql:5.7

docker container exec -it mysql mysql -u root -p volume_test

CREATE TABLE user(
  id int PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE utf8mb4_unicode_ci;

docker container stop mysql

docker container run -d --rm --name mysql \
	-e "MYSQL_ALLOW_EMPTY_PASSWORD=yes" \
	-e "MYSQL_DATABASE=volume_test" \
	-e "MYSQL_USER=example" \
	-e "MYSQL_PASSWORD=example" \
	--volumes-from mysql-data \
	mysql:5.7

docker container exec -it mysql mysql -u root -p volume_test

SELECT * FROM user;

docker container run -v `${PWD}`:/tmp \
	--volume-from mysql-data \
	busybox \
	tar cvzf /tmp/mysql-backup.tar.gz /var/lib/mysql

docker container exec -it manager docker swarm init
docker container exec -it manager docker swarm join \
	--token XXX manager:2377
docker container exec -it amanger docker node ls
docker image tag tky/echo:latest localhost:5000/eky/echo:latest
docker image push localhost:5000/echo:latest
docker container exec -it worker01 docker image pull registry:5000/eky/echo:latest
docker container exec -it worker01 docker image ls

docker container exec -it manager \
	docker service create --replicas 1 --publish 8080:8080 --name echo registry:5000/eky/echo:latest

docker container exec -it manager docker service ls
docker container exec -it manager docker service scale echo=6
docker container exec -it manager docker service ps echo | grep Running
docker container exec -it manager docker service rm echo
docker container exec -it manager docker service ls

docker container exec -it manager docker network create --driver=overlay--attachable ch03

docker container exec -it manager docker stack deploy -c /stack/ch03=webapi.yml echo 
docker container exec -it manager docker stack service echo

docker container exec -it manager docker stack deploy -c /stack/visualizer.yml visualizer
docker container exec -it manager docker stack rm echo

docker container exec -it manager docker service ls
curl http://localhost:8000/

#!/bin/bash
sudo docker swarm join --token $SWARM_JOIN_TOKEN manager.tky.local:2377



