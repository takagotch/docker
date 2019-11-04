










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





docker image build -f Docker-nuxt -t ch/04/nginx-nuxt:latest .
docker image tag ch04/nginx-nuxt:latest localhost:5000/ch04/nginx-nuxt:latest
docekr image push localhost:5000/ch04/nginx-nuxt:latest


docker container exec -it manager \
docker stack deploy -c /stack/todo-ingress.yml todo_ingress

curl -I http://localhost:8000/
curl -I http://localhost:8000/_nuxt/app.84213abc389efeece29614.js
