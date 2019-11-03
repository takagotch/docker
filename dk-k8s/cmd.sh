










## docker-swarm
# todo-ingress.yml
docker container exec -it manager docker node ls
docker container exec -it manager \
docker network create --driver=overlay --attachable todoapp

git clone https://github.com/gihyodocker/tododb

cd tododb



docker image build -f Docker-nuxt -t ch/04/nginx-nuxt:latest .
docker image tag ch04/nginx-nuxt:latest localhost:5000/ch04/nginx-nuxt:latest
docekr image push localhost:5000/ch04/nginx-nuxt:latest


docker container exec -it manager \
docker stack deploy -c /stack/todo-ingress.yml todo_ingress

curl -I http://localhost:8000/
curl -I http://localhost:8000/_nuxt/app.84213abc389efeece29614.js
