# notes

start sh in container
    docker exec -it <container id> sh 

start docker compose
    docker-compose up

check ports listen
    sudo lsof -i -P -n | grep 

kill process
    sudo kill <port number>