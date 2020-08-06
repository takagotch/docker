###### rails6 sqlite3
---


```sh
mkdir app & cd /usr/src/app

git clone https://github.com/takagotch/docker.git
cp docker/rails-dev /usr/src/app

docker-compose --rm web rails new. --force --skkip-bundle
docker-compose build
docker-compose run --rm web rake db:create
docker-compose up
docker-compose ps


docker-compose run web rails g scaffold Blog title:string body:text
docker-compose build
docker-compose up

rm -rf tmp/pids/server.pid
docker-compose up

```

```sh
rails new app
bundle init
vi Gemfile
bunele install
```

```sh

```

```sh

```


```sh
make rs
make rc

```
