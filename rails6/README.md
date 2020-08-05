###### docker-compose takagotch/rails6

- Dockerfile
- Gemfile
- Gemfile.lock
- entrypoint.sh
- docker-compose.yml

```sh
# git clone git@github.com:takagotch/docker.git
# mkdir apptky && cd apptky


$ docker-compose run web rails new . --force --no-deps --database=postgresql --skip-bundle
docker-compose build
vi config/database.yml
docker-compose run web rake db:create
docker-compose up
curl http://localhost:3000/

docker-compose down
```

```sh
# vi config/database.yml

default: &default
  adapter: postgresql
  encoding: unicode
  host: db
  username: postgresql
  password: password 
  pool: 5
:
:
development:
  <<: *default
  database: myapp_development
:
:
test:
  <<: *default
  database: myapp_test

```

###### docker-compose
```
docker-compose ps
docker-compose up
docker-compose up -d
docker-compose stop
docker-compose restart

docker-compose down
docker-compose down --rmi all
docker-compose rm 
docker-compose rm -f
docker-compose down -v
docker volume rm pgdata
```

```

```
