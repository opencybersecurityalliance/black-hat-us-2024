#!/usr/bin/sh

docker ps | grep opencybersecurityalliance | cut -d ' ' -f1 | xargs docker stop

nohup jupyter-repo2docker https://github.com/opencybersecurityalliance/black-hat-us-2024.git &

while true
do
    sleep 1
    container=$(docker ps | grep opencybersecurityalliance)
    if [ -z "$container" ]
    then
        echo "wait for container to go up..."
    else
        port=$(docker ps | grep opencybersecurityalliance | cut -d ':' -f2 | cut -d '-' -f1)
        firefox http://localhost:$port/tree
        break
    fi
done
