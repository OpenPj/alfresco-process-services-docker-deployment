#!/bin/sh

build() {
    docker-compose build
}

build_start() {
    docker volume create aps-db-sa-volume
    docker volume create aps-admin-db-sa-volume
    docker volume create aps-contentstore-sa-volume
	docker volume create aps-es-sa-volume
    docker-compose up --build -d
}

start() {
    docker volume create aps-db-sa-volume
    docker volume create aps-admin-db-sa-volume
    docker volume create aps-contentstore-sa-volume
	docker volume create aps-es-sa-volume
    docker-compose up -d
}

down() {
        docker-compose down
}

purge() {
    docker volume rm aps-db-sa-volume
    docker volume rm aps-admin-db-sa-volume
    docker volume rm aps-contentstore-sa-volume
	docker volume rm aps-es-sa-volume
}

tail() {
    docker-compose logs -f
}

tail_all() {
    docker-compose logs --tail="all"
}

case "$1" in
  build)
    build
    ;;
  build_start)
    build_start
    tail
    ;;
  start)
    start
    tail
    ;;
  stop)
    down
    ;;
  purge)
    down
    purge
    ;;
  tail)
    tail
    ;;
  *)
    echo "Usage: $0 {build_start | build | start | stop | purge | tail}"
esac
