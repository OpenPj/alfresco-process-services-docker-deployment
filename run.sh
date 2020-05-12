#!/bin/sh

start() {
    docker volume create aps-db-volume
    docker volume create aps-admin-db-volume
    docker volume create aps-contentstore-volume
	docker volume create aps-es-volume
    docker-compose up --build -d
}

down() {
        docker-compose down
}

purge() {
    docker volume rm aps-db-volume
    docker volume rm aps-admin-db-volume
    docker volume rm aps-contentstore-volume
	docker volume rm aps-es-volume
}

tail() {
    docker-compose logs -f
}

tail_all() {
    docker-compose logs --tail="all"
}

case "$1" in
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
    echo "Usage: $0 {start|stop|purge|tail}"
esac