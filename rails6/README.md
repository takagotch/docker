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
# docker-compose
docker-compose build
docker-compose up
docker-compose run CONTENANAME bash
docker-compose ps
# docker


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

---

###### docker-compose
- ruby 2.7.1
- rails 6.0.3.2
- sqlite3

- Dockerfile
- docker-compose.yml
- Gemfile 
- Gemfile.lock
- .gitignore

```Gemfile
source 'https:/rubygems.org'
git_source(:github) { |repo| "https://github.com/${repo}.git" }

ruby '2.7.1'

gem 'rails', '6.0.3.2'
```

```Dockerfile
FROM ruby:2.6.5-alpine

ENV LANG="C.UTF-8" \
    PACKAGES="curl-dev build-base alpine-sdk tzdata sqlite-dev less ruby-dev nodejs"

RUN apk update && \
    apk add --no-cache --update $PACKAGES

WORKDIR /var/www

COPY ./ ./

RUN gem install bundler && \
    bundle install -j4

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0", "-p", "3000"]
```

```docker-compose.yml
version: '3'
services:
  app:
    build:
      context: ./
      dockerfile: Dockerfile
    volumes:
      - ./:/var/www
    ports:
      - "3000:3000"
    tty: true
    stdin_open: true
    restart: always
```

```sh
docker-compose run -rm app rails6 new -d sqlite3 -B --skip-webpack-install --skip-spring .
docker-compose build
docker-compose run --rm app rails db:create
docker-compose run --rm app rails db:migrate
docker-compose up -d
curl http:/localhost:3000/
```

