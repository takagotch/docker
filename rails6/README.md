###### docker-compose takagotch/rails6

- Dockerfile
- Gemfile
- Gemfile.lock
- entrypoint.sh
- docker-compose.yml

```sh
# git clone git@github.com:takagotch/docker.git
# mkdir apptky && cd apptky


docker-compose run web rails new . --force --no-deps --database=postgresql
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

