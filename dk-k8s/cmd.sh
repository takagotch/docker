







## 3 docker

docker image build -t example/cronjob:latest .
docker container run -d -rm -name cronjob example/cronjob:latest
docker container exec -it cronjob tail -f /var/log/cron.log

/*
db.driverClass=${DB_DRIVER_CLASS:com.mysql.jdbc.Driver}
db.jdbcUrl=${DB_JDBC_RUL}
db.user=${DB_USER}
db.password=${DB_PASSWORD}
db.initialSize=${DB_INITIAL_SIZE:10}
db.maxActive=${DB_MAX_ACTIVE:50}
db.maIdle=${DB_MAX_IDLE:20}
db.minIdle=${DB_MIN_IDLE:10}
*/ 

docker container run -v ${PWD}:/workspace gihyodocker/imagemagick:latest
ls -l
docker container run -d -p 8080:8080 -v ${PWD}/jenkins_home:/var/jenkins_home jenkins:latest

docker image build -t example/mysql-data:latest .
docker container run -d --name mysql-data example/mysql-data:latest
docker container run -d --rm  --name mysql \
	 -e "MYSQL_ALLOW_EMPTY_PASSWORD=yes" \
	 -e "MYSQL_DATABASE=volume_test" \
	 -e "MYSQL_USER=example" \
	 -e "MYSQL_PASSWORD=example" \
	 --volumes-from mysql-data \
	 mysql:5.7

docker container exec -it mysql mysql -u root -p volume_test
CREATE TABLE user(
  id int PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255)
) engine=iNNOdb default charset=utf8mb4 COLLATE utf8mb4_unicode_ci;
INSERT INTO user (name) VALUES ('gihyo'), ('docker'), ('Solomon Hykes');

docker container stop mysql
docker container run -d --rm --name mysql \
	- e "MYSQL_ALLOW_EMPTY_PASSWORD=yes" \
	- e "MYSQL_DATABASE=volume_test" \
	- e "MYSQL_USER=example" \
	- e "MYSQL_PASSWORD=example" \
	--volumes-from mysql-data \
	mysql:5.7

docker container exec -it mysql mysql -u root -p volume_test
SELECT * FROM user;

docker container run -v `${PWD}`:/tmp \
--volumes-from mysql-data \
busybox \
tar cvzf /tmp/mysql-backup.tar.gz /var/lib/mysql


docker-compose up -d
docker container ls
docker container exec -it manager docker swarm init
docker container exec -it worker01 docker swarm join \
--token SWMTKN-1-1xxx manager:2377
docker container exec -it docker node ls


docker image tag example/echo:latest localhost:5000/example/echo:latest
docker image push localhost:5000/example/echo:latest
docker container exec -it worker01 docker image pull registry:500/example/echo:latest
docker container exec -it worker01 docker image ls
docker container exec -it manager \
docker service create --replicas 1 --publish 8000:8000 --name echo registry:5000/example/echo:latest

docker container exec -it manager docker service ls
docker container exec -it manager docker service scale echo=6
docker container exec -it manager docker service ps echo | grep Running
docker container exec -it manager docker service rm echo
docker container exec -it manager docker service rm ls

docker container exec -it manager docker network create --driver=overlay --attachable ch03
docker container exec -it manager deploy -c /stack/ch03-webapi.yml echo
docker container exec -it manager docker stack services echo

docker container exec -it manager docker stack ps echo
docker container exec -it manager docker stack deploy -c /stack/visualizer.yml visualizer
docker container exec -it manager docker stack rm echo

docker container exec -it manager docker stack deploy -c /stack/ch03-webapi.yml echo
docker container exec -it manager docker stack deploy -c /stack/ch03-ingress.yml ingress

docker container exec -it manager docker serice ls
curl http://localhost:8000


## docker-swarm
# todo-ingress.yml
docker container exec -it manager docker node ls
docker container exec -it manager \
docker network create --driver=overlay --attachable todoapp

git clone https://github.com/gihyodocker/tododb

cd tododb

mysql -h $MYSQL_MASTER_HOST

CREATE USER IF NOT EXISTS 'replicationUserName'@'SlaveHostIPAddress'
GRANT REPLICATION SLAVE on *.* to 'ReplicationUserName'@'SlaveHostIPAddress';

show master status;

CHANGE MASTER TO MASTER_HOST='master', MASTER_USR='repl', MASTER_PASSWORD


docker image build -t ch04/tododb:latest .
docker image tag ch04/tododb:latest localhost:5000/ch04/tododb:latest
docekr image push localhost:5000/ch04/tododb:latest


docker container exec -it manager \
docker stack deploy -c /stack/todo-mysql.yml todo_mysql
docker container exec -it manager \
docker service ls

docker container exec -it manager \
docker service ps todo_mysql_master --no-trunc \
--filter "desired-stat=running"

docker container exec -it xxxx \
docker container exec -it manager \
docker service ps todo_mysql_master \
--no-trunc \
--filter "" \
--format "docker container exec -it {{.Node}} docker container exec -it {{.Name}}.{{.ID}} bash"

docker container exec -it xxxx \
docker container exec -it todo_mysql_master.l.xxxx \
init-data.sh

docker container exec -it xxxx \
docker container exec -it todo_mysql_master.1.xxxx \
mysql -u gihyo -pgihyo tododb

SELECT * FROM todo LIMIT 1\G

docker container exec -it manager \
docker service ps todo_mysql_slave \
--no-trunc \
--filter "desired-state=running" \
--format "docker container exec -it {{.Node}} docker container exec -it {{.Name}}.{{.ID}} bash"

docker container exec -it xxxx \
docker container exec -it todo_mysql_slave.1.xxxx

SELECT * FROM todo LIMIT 1\G

git clone https://github.com/gihyodocker/todoapi

tree -a -I '.git|.gitignore' .

curl -s -XGET http://localhost:8000/todo?status=TODO | jq .
curl -XPOST -d '{
  "title": "stringtxt",
  "content": "stringtxt"
}' http://localhost:8080/todo

curl -XPUT -d '{
  "id": 1,
  "title": "txt",
  "content": "txt",
  "status": "PROGRESS"
}' http://localhost:8080/todo

docker image build -t ch04/todoapi:latest .
docker image tag ch04/todoapi:latest localhost:5000/ch04/todoapi:latest
docker image push localhost:5000/ch04/todoapi:latest


docker container exec -it manager docker stack deploy -c /stack/todo-app.yml todo_app 
docker container exec -it manager docker service logs -f todo_app_api

git clone https://github.com/gihyodocker/todonginx
cd todonginx
tree .

cd /etc/nginx
tree .

docker image build -t ch04/nginx:latest .
CMD nginx -g "daemon off;"
docker image tagged ch04/nginx:latest
docker image push localhost:5000/ch04/nginx:latest

docker container exec -it manager docker stack deploy -c /stack/todo-app.yml todo_app

git clone https://github.com/gihyodocker/todoweb
tree .

npm install
npm run build
npm run start

docker image built -t ch04/todoweb:latest .
docker image tag ch04/todoweb:latest localhost:5000/ch04/todoweb:latest
docker image push localhost:5000/ch04/todoweb:latest


. nuxt/dist

cp etc/nginx/conf.d/public.conf.tmpl etc/nginx/conf.d/nuxt.conf.tmpl


docker image build -f Dockerfile-nuxt -t ch04/nginx-nuxt:latest .
docker image tag ch04/nginx-nuxt:latest localhost:5000/ch04/nginx-nuxt:latest
docker image push localhost:5000/nginx-nuxt:latest



docker container exec -it manager \
docker stack deploy -c /stack/todo-ingress.yml todo_ingress

curl -I http://localhost:8000/
curl -I http://localhost:8000/_nuxt/app.84213abc389efeece29614.js


